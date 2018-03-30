//
//  TwitchAuthorizationManager
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 10/11/16.
//
// Note that the Twitch API never has tokens expire, so if a token exists it is valid indefinitely

import Foundation
//import Locksmith
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
//            if let result = Locksmith.loadDataForUserAccount(userAccount: userAccount) {
//                return result["accessToken"] as? String
//            } else {
//                EVLog(text: "Bad retrieval of access token", line: #line, fileName: #file)
//                return nil
//            }
            return nil
        }
    }
    
    ///Scopes authorized from server **Read Only**.
    public var scope: [String]? {
        get {
//            if let result = Locksmith.loadDataForUserAccount(userAccount: userAccount) {
//                return result["scopes"] as? [String]
//            } else {
//                EVLog(text: "Bad retrieval of scope", line: #line, fileName: #file)
//                return nil
//            }
            return nil
        }
    }
    
    ///Authorization refresh token **Read Only**.
    public var refreshToken: String? {
        get {
//            if let result = Locksmith.loadDataForUserAccount(userAccount: userAccount) {
//                return result["refreshToken"] as? String
//            } else {
//                EVLog(text: "Bad retrieval of refresh token", line: #line, fileName: #file)
//                return nil
//            }
            return nil
        }
    }
    
    private var credentials: Credentials? {
        get {
            return nil
        }
        set {
//            if let valueToSave = newValue {
//                do{
//                    try Locksmith.updateData(data: ["accessToken" : valueToSave.accessToken!, "refreshToken" : valueToSave.refreshToken!, "scopes" : valueToSave.scope!], forUserAccount: userAccount)
//                } catch LocksmithError.allocate {
//                    EVLog(text: LocksmithError.allocate.rawValue, line: #line, fileName: #file)
//                } catch LocksmithError.authFailed {
//                    EVLog(text: LocksmithError.authFailed.rawValue, line: #line, fileName: #file)
//                } catch LocksmithError.decode {
//                    EVLog(text: LocksmithError.decode.rawValue, line: #line, fileName: #file)
//                } catch LocksmithError.duplicate {
//                    EVLog(text: LocksmithError.duplicate.rawValue, line: #line, fileName: #file)
//                } catch LocksmithError.interactionNotAllowed {
//                    EVLog(text: LocksmithError.interactionNotAllowed.rawValue, line: #line, fileName: #file)
//                } catch LocksmithError.noError {
//                    EVLog(text: LocksmithError.noError.rawValue, line: #line, fileName: #file)
//                } catch LocksmithError.notAvailable {
//                    EVLog(text: LocksmithError.notAvailable.rawValue, line: #line, fileName: #file)
//                } catch LocksmithError.notFound {
//                    EVLog(text: LocksmithError.notFound.rawValue, line: #line, fileName: #file)
//                } catch LocksmithError.param {
//                    EVLog(text: LocksmithError.param.rawValue, line: #line, fileName: #file)
//                } catch LocksmithError.requestNotSet {
//                    EVLog(text: LocksmithError.requestNotSet.rawValue, line: #line, fileName: #file)
//                } catch LocksmithError.typeNotFound {
//                    EVLog(text: LocksmithError.typeNotFound.rawValue, line: #line, fileName: #file)
//                } catch LocksmithError.unableToClear {
//                    EVLog(text: LocksmithError.unableToClear.rawValue, line: #line, fileName: #file)
//                } catch LocksmithError.undefined {
//                    EVLog(text: LocksmithError.undefined.rawValue, line: #line, fileName: #file)
//                } catch LocksmithError.unimplemented {
//                    EVLog(text: LocksmithError.unimplemented.rawValue, line: #line, fileName: #file)
//                } catch {
//                    EVLog(text: "Unknown error occured saving value to the keychain", line: #line, fileName: #file)
//                }
//            } else {
//                EVLog(text: "Bad value: \(String(describing: newValue))", line: #line, fileName: #file)
//            }
        }
    }
    
    private var state: String?
    private let userAccount = "twitch"
    private let userDefaultsKey = "loadingOauthToken"
    
    //MARK: - Initializer
    
    ///Others should not initialize the Singleton.
    private init(){}
    
    //MARK: - Public Functions
    
    ///Returns true if a valid authorization token exists.
    public func hasOAuthToken() -> Bool {
        return authToken != nil && !authToken!.isEmpty
    }
    
    /**
     Starts the Twitch authorization flow with the Server.
     
     - throws `AuthorizationError`.
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
                EVLog(text: "Invalid auth url: \(authPath)", line: #line, fileName: #file)
                throw AuthorizationError.invalidAuthURL(desc: "Authorization url is invalid, please check your values for the Redirect URI, Client Id, and scopes", url: authPath)
            }
            UIApplication.shared.open(authURL, completionHandler: nil)
            defaults.set(true, forKey: userDefaultsKey)
        } else {
            EVLog(text: "Authorization token exits or authorization is in progress...no need to authorization again", line: #line, fileName: #file)
        }
    }
    
    /**
     Processes the callback url and recieves authorization token from the server.
     
     - parameter url: The callback url.
    */
    public func processOauthResponse(with url: URL, completion: @escaping (_ result: Result<Credentials>) -> ()) {
        let defaults = UserDefaults.standard
        defaults.set(false, forKey: userDefaultsKey)
        let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        guard let queryItems = components?.queryItems else {
            completion(.failure(AuthorizationError.invalidURLResponse(url: url)))
            return
        }
        
        let code: String? = queryItems.filter { $0.name.lowercased() == "code" }.first?.value
        
        if let receivedCode = code {
            let path = URL(string: Constants.network.oauthTokenURL)
            guard let clientID = clientID, let redirectURI = redirectURI, let clientSecret = clientSecret, let state = state else {
                completion(.failure(AuthorizationError.invalidQueryParameters(desc: "Must define values for the Client Id, Redirect URI,  and Client Secret")))
                return
            }
            let postData = "client_id=\(clientID)&client_secret=\(clientSecret)&grant_type=authorization_code&redirect_uri=\(redirectURI)&code=\(receivedCode)&state=\(state)".data(using: .ascii)
            let authorizationResource = AuthorizationResource(data: postData!, url: path!)
            authorizationResource.processAuthorization(completion: { [weak self] (result) in
                guard let strongSelf = self else {
                    EVLog(text: "Error: self does not exist", line: #line, fileName: #file)
                    return
                }
                
                switch result {
                case let .failure(error):
                    completion(.failure(error))
                case let .success(credentials):
                    strongSelf.credentials = credentials
                    completion(.success(credentials))
                }
            })
        } else {
            completion(.failure(AuthorizationError.noCode(desc: "no code was present in the query items returned from the server")))
        }
    }
    
    /**
     Removes users credentials from the app forcing re-authentication with Twitch
     
     - throws: 'LocksmithError' see: https://github.com/matthewpalmer/Locksmith
    */
    public func logout() throws {
        authFailed()
//        try Locksmith.deleteDataForUserAccount(userAccount: userAccount)
    }
    
    ///Can be called to ensure all settings are properly updated on authentication failure.
    public func authFailed() {
        let defaults = UserDefaults.standard
        defaults.set(false, forKey: userDefaultsKey)
    }
}


