//
//  TwitchAuthorizationManager
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 10/11/16.
//
// Note that the Twitch API never has tokens expire, so if a token exists it is valid indefinitely

import Foundation
import Locksmith
import UIKit

///Error for authentication requests.
public enum AuthorizationError: Error {
    /**
     Specifies that the url response from the server does not contain `queryItems`.
     
     - parameter url: The url that does not contain query items.
    */
    case invalidURLResponse(url: URL)
    /**
     Specifies that the JSON response could not be properly parsed.
     
     - parameter JSON: The JSON that could not be parsed.
    */
    case unableToParseJSON(json: String)
    /**
     Specifies that an unknown error has occured.
     
     - parameter Error: the error that was thrown.
     */
    case unknownError(Error)
    /**
     Specifies that the parameters included in the url request are not properly defined.
     
     - parameter desc: Description of what parameters must be defined.
     */
    case invalidQueryParameters(desc: String)
    /**
     Specifies that the authorization url is invalid.
     
     - parameter desc: Description of what makes a valid authorization url.
     - parameter url: The provided, invalid, url.
    */
    case invalidAuthURL(desc: String, url: String)
    /**
     Specifies that the authorization code returned is invalid, or missing.
     
     - parameter desc: Description of the missing code.
    */
    case noCode(desc: String)
}

/**
 The `TwitchAuthorizationManager` is responsible for managing the oauth2 bearer token flow with the Twitch server.
 */
public class TwitchAuthorizationManager {
    //MARK: - Properties
    
    ///Singleton instance of the Authorization manager.
    public static let sharedInstance = TwitchAuthorizationManager()
    
    ///The Client Id used for authorization.
    public var clientID: String?
    
    ///The Client Secret used for authorization.
    public var clientSecret: String?
    
    ///The Redirect URI used for authorization.
    public var redirectURI: String?
    
    ///The scopes the user is authorized.
    public var scopes: String?
    
    ///Authorization token **Read Only**.
    public var authToken: String? {
        get {
            if let result = Locksmith.loadDataForUserAccount(userAccount: userAccount) {
                return result["accessToken"] as? String
            } else {
                NSLog("Bad retrieval of access token")
                return nil
            }
        }
    }
    
    ///Scopes authorized from server **Read Only**.
    public var scope: [String]? {
        get {
            if let result = Locksmith.loadDataForUserAccount(userAccount: userAccount) {
                return result["scopes"] as? [String]
            } else {
                NSLog("Bad retrieval of the authorized scopes")
                return nil
            }
        }
    }
    
    ///Authorization refresh token **Read Only**.
    public var refreshToken: String? {
        get {
            if let result = Locksmith.loadDataForUserAccount(userAccount: userAccount) {
                return result["refreshToken"] as? String
            } else {
                NSLog("Bad retrieval of refresh token")
                return nil
            }
        }
    }
    
    private var credentials: Credentials? {
        get {
            return nil
        }
        set {
            if let valueToSave = newValue {
                do{
                    try Locksmith.updateData(data: ["accessToken" : valueToSave.accessToken!, "refreshToken" : valueToSave.refreshToken!, "scopes" : valueToSave.scope!], forUserAccount: userAccount)
                    NSLog("saved scopes")
                } catch LocksmithError.allocate {
                    NSLog(LocksmithError.allocate.rawValue)
                } catch LocksmithError.authFailed {
                    NSLog(LocksmithError.authFailed.rawValue)
                } catch LocksmithError.decode {
                    NSLog(LocksmithError.decode.rawValue)
                } catch LocksmithError.duplicate {
                    NSLog(LocksmithError.duplicate.rawValue)
                } catch LocksmithError.interactionNotAllowed {
                    NSLog(LocksmithError.interactionNotAllowed.rawValue)
                } catch LocksmithError.noError {
                    NSLog(LocksmithError.noError.rawValue)
                } catch LocksmithError.notAvailable {
                    NSLog(LocksmithError.notAvailable.rawValue)
                } catch LocksmithError.notFound {
                    NSLog(LocksmithError.notFound.rawValue)
                } catch LocksmithError.param {
                    NSLog(LocksmithError.param.rawValue)
                } catch LocksmithError.requestNotSet {
                    NSLog(LocksmithError.requestNotSet.rawValue)
                } catch LocksmithError.typeNotFound {
                    NSLog(LocksmithError.typeNotFound.rawValue)
                } catch LocksmithError.unableToClear {
                    NSLog(LocksmithError.unableToClear.rawValue)
                } catch LocksmithError.undefined {
                    NSLog(LocksmithError.undefined.rawValue)
                } catch LocksmithError.unimplemented {
                    NSLog(LocksmithError.unimplemented.rawValue)
                } catch {
                    NSLog("Unknown error occured saving value to the keychain")
                }
            } else {
                NSLog("Bad value: \(newValue)")
            }
        }
    }
    
    private var state: String?
    private let userAccount = "twitch"
    private let userDefaultsKey = "loadingOauthToken"
    
    //MARK: - Initializer
    
    ///Others should not initialize the Singleton.
    private init(){}
    
    //MARK: - Public Functions
    
    ///Returns a true if an valid authorization token exists.
    public func hasOAuthToken() -> Bool {
        return authToken != nil && !authToken!.isEmpty
    }
    
    /**
     Starts the login authorization flow with the Server.
     
     - throws: `AuthorizationException`.
    */
    public func login() throws {
        //user defaults, what about refresh token i.e. when does token expire?
        let defaults = UserDefaults.standard
        if !defaults.bool(forKey: userDefaultsKey) && authToken == nil {
            state = NSUUID().uuidString
            guard let clientID = clientID, let redirectURI = redirectURI, let scopes = scopes, let state = state else {
                throw AuthorizationError.invalidQueryParameters(desc: "Must define values for the Client Id, Redirect URI, and scopes")
            }
            let authPath = "https://api.twitch.tv/kraken/oauth2/authorize?response_type=code&client_id=\(clientID)&redirect_uri=\(redirectURI)&scope=\(scopes)&state=\(state)"
            guard let authURL = URL(string: authPath) else {
                NSLog("Invalid auth url: \(authPath)")
                throw AuthorizationError.invalidAuthURL(desc: "Authorization url is invalid, please check your values for the Redirect URI, Client Id, and scopes", url: authPath)
            }
            UIApplication.shared.open(authURL, completionHandler: nil)
            defaults.set(true, forKey: userDefaultsKey)
        } else {
            NSLog("Authorization token exits or authorization is in progress...no need to authorization again")
        }
    }
    
    /**
     Processes the callback url and recieves authorization token from the server.
     
     - parameter url: The callback url.
    */
    public func processOauthResponse(with url: URL, completion: @escaping (_ result: Result<Credentials>) -> ()) {
        let defaults = UserDefaults.standard
        let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        guard let queryItems = components?.queryItems else {
            defaults.set(false, forKey: userDefaultsKey)
            completion(.failure(AuthorizationError.invalidURLResponse(url: url)))
            return
        }
        
        let code: String? = queryItems.filter { $0.name.lowercased() == "code" }.first?.value
        
        if let receivedCode = code {
            let path = URL(string: Constants.network.oauthTokenURL)
            guard let clientID = clientID, let redirectURI = redirectURI, let clientSecret = clientSecret, let state = state else {
                completion(.failure(AuthorizationError.invalidQueryParameters(desc: "Must define values for the Client Id, Redirect URI,  and Client Secret")))
                defaults.set(false, forKey: userDefaultsKey)
                return
            }
            let postData = "client_id=\(clientID)&client_secret=\(clientSecret)&grant_type=authorization_code&redirect_uri=\(redirectURI)&code=\(receivedCode)&state=\(state)".data(using: .ascii)
            let authorizationResource = AuthorizationResource(data: postData!, url: path!)
            authorizationResource.processAuthorization(completion: { [weak self] (result) in
                guard let strongSelf = self else {
                    NSLog("Error: self does not exist")
                    return
                }
                
                defaults.set(false, forKey: strongSelf.userDefaultsKey)
                switch result {
                case let .failure(error):
                    completion(.failure(error))
                case let .success(credentials):
                    strongSelf.credentials = credentials
                    completion(.success(credentials))
                }
            })
        } else {
            defaults.set(false, forKey: userDefaultsKey)
            completion(.failure(AuthorizationError.noCode(desc: "no code was present in the query items returned from the server")))
        }
    }
}

