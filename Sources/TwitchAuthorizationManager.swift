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
     Specifies that the url response from the server does not contain `queryItems`
     - parameter: url: The url that does not contain query items.
    */
    case invalidURLResponse(url: URL)
    /**
     Specifies that the JSON response could not be properly parsed.
     - parameter: JSON: The JSON that could not be parsed.
    */
    case unableToParseJSON(json: String)
    /**
     Specifies that an unknown error has occured.
     - parameter: Error: the error that was thrown.
     */
    case unknownError(Error)
    /**
     Specifies that the parameters included in the url request are not properly defined.
     - parameter: desc: Description of what parameters must be defined.
     */
    case invalidQueryParameters(desc: String)
    /**
     Specifies that the authorization url is invalid.
     - parameter: desc: Description of what makes a valid authorization url.
     - parameter: url: The provided, invalid, url.
    */
    case invalidAuthURL(desc: String, url: String)
}
///TODO: Abstract url request away
///TODO: Add facade for login with check for existing token or that the flow has already been started
///TODO: End flow in the case of exception user defaults
/**
 The `TwitchAuthorizationManager` is responsible for managing the oauth2 bearer token flow with the Twitch server.
 */
public class TwitchAuthorizationManager {
    //MARK: Properties
    
    ///Singleton instance of the Authorization manager.
    public static let sharedInstance = TwitchAuthorizationManager()
    
    ///The Client Id used for authentication.
    public var clientID: String?
    
    ///The Client Secret used for authentication.
    public var clientSecret: String?
    
    ///The Redirect URI used for authentication.
    public var redirectURI: String?
    
    ///The scopes the user is authorized.
    public var scopes: String?
    
    ///Authorization Token **Read Only**.
    public var authToken: String? {
        get {
            return oauthToken
        }
    }
    
    private var oauthToken: String? {
        get {
            guard let dictionary = Locksmith.loadDataForUserAccount(userAccount: userAccount) else {
                NSLog("Could not get Locksmith dictionary.")
                return nil
            }
            guard let token = dictionary["token"] as? String else {
                NSLog("Could not get token from Locksmith.")
                return nil
            }
            return token
        }
        set {
            if let valueToSave = newValue {
                do{
                    try Locksmith.updateData(data: ["token" : valueToSave], forUserAccount: userAccount)
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
    
    //MARK: Initializer
    ///Others should not initialize the Singleton.
    private init(){}
    
    //MARK: Public Functions
    ///Returns a true if an valid authentication token exists.
    public func hasOAuthToken() -> Bool {
        return oauthToken != nil && !(oauthToken?.isEmpty)!
    }
    
    /**
     Starts the login authentication flow with the Server.
     - throws: `AuthorizationException`.
    */
    public func login() throws {
        //user defaults, what about refresh token i.e. when does token expire?
        let defaults = UserDefaults.standard
        defaults.set(false, forKey: userDefaultsKey)
        if !defaults.bool(forKey: userDefaultsKey) {
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
        } else {
            NSLog("Authorization token exits or authorization is in progress...no need to authenticate again")
        }
    }
    
    /**
     Processes the callback url and recieves authentication token from the server.
     - parameter url: The callback url.
     
     - throws: `AuthorizationException`.
    */
    public func processOauthResponse(with url: URL) throws {
        let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        guard let queryItems = components?.queryItems else {
            throw AuthorizationError.invalidURLResponse(url: url)
        }
        
        let code: String? = queryItems.filter { $0.name.lowercased() == "code" }.first?.value
        
        if let receivedCode = code {
            let path = URL(string: Constants.network.oauthTokenURL)
            guard let clientID = clientID, let redirectURI = redirectURI, let clientSecret = clientSecret, let state = state else {
                throw AuthorizationError.invalidQueryParameters(desc: "Must define values for the Client Id, Redirect URI,  and Client Secret")
            }
            //ascii string vs json??? & abstract the url session to a resource
            let postData = "client_id=\(clientID)&client_secret=\(clientSecret)&grant_type=authorization_code&redirect_uri=\(redirectURI)&code=\(receivedCode)&state=\(state)".data(using: .ascii)
            let urlSession = URLSession.shared
            var request = URLRequest(url: path!)
            request.httpBody = postData
            request.httpMethod = "POST"
            let task = urlSession.dataTask(with: request, completionHandler: { data, response, error in
                if error == nil {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
                        guard let jsonResponse = json as? [String: AnyObject] else {
                            NSLog("Error parsing response")
                            return
                        }
                        //probably want to save this refresh_token too...maybe move to retrievable model :)
                        //NSLog(jsonResponse["refresh_token"] as? String ?? "bad json")
                        print(json)
                        
                        self.oauthToken = "\(jsonResponse["access_token"])"
                    } catch {
                        NSLog("Error parsing json")
                    }
                } else {
                    NSLog("Error: this needs to be updated...")
                }
            })
            task.resume()
        }
    }
}


