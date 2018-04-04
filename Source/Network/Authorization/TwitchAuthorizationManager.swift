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
import SafariServices

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
            guard let result = Locksmith.loadDataForUserAccount(userAccount: userAccount)  else {
                EVLog(text: "Bad retrieval of access token", line: #line, fileName: #file)
                return nil
            }
            return result["accessToken"] as? String
        }
    }
    
    ///Scopes authorized from server **Read Only**.
    public var authorizedScopes: [String]? {
        get {
            guard let result = Locksmith.loadDataForUserAccount(userAccount: userAccount) else {
                EVLog(text: "Bad retrieval of scope", line: #line, fileName: #file)
                return nil
            }
            return result["scopes"] as? [String]
        }
    }
    
    private var credentials: Credentials? {
        get {
            return nil
        }
        set {
            if let valueToSave = newValue {
                do{
                    try Locksmith.updateData(data: ["accessToken" : valueToSave.accessToken!, "scopes" : valueToSave.scope!], forUserAccount: userAccount)
                } catch LocksmithError.allocate {
                    EVLog(text: LocksmithError.allocate.rawValue, line: #line, fileName: #file)
                } catch LocksmithError.authFailed {
                    EVLog(text: LocksmithError.authFailed.rawValue, line: #line, fileName: #file)
                } catch LocksmithError.decode {
                    EVLog(text: LocksmithError.decode.rawValue, line: #line, fileName: #file)
                } catch LocksmithError.duplicate {
                    EVLog(text: LocksmithError.duplicate.rawValue, line: #line, fileName: #file)
                } catch LocksmithError.interactionNotAllowed {
                    EVLog(text: LocksmithError.interactionNotAllowed.rawValue, line: #line, fileName: #file)
                } catch LocksmithError.noError {
                    EVLog(text: LocksmithError.noError.rawValue, line: #line, fileName: #file)
                } catch LocksmithError.notAvailable {
                    EVLog(text: LocksmithError.notAvailable.rawValue, line: #line, fileName: #file)
                } catch LocksmithError.notFound {
                    EVLog(text: LocksmithError.notFound.rawValue, line: #line, fileName: #file)
                } catch LocksmithError.param {
                    EVLog(text: LocksmithError.param.rawValue, line: #line, fileName: #file)
                } catch LocksmithError.requestNotSet {
                    EVLog(text: LocksmithError.requestNotSet.rawValue, line: #line, fileName: #file)
                } catch LocksmithError.typeNotFound {
                    EVLog(text: LocksmithError.typeNotFound.rawValue, line: #line, fileName: #file)
                } catch LocksmithError.unableToClear {
                    EVLog(text: LocksmithError.unableToClear.rawValue, line: #line, fileName: #file)
                } catch LocksmithError.undefined {
                    EVLog(text: LocksmithError.undefined.rawValue, line: #line, fileName: #file)
                } catch LocksmithError.unimplemented {
                    EVLog(text: LocksmithError.unimplemented.rawValue, line: #line, fileName: #file)
                } catch {
                    EVLog(text: "Unknown error occured saving value to the keychain", line: #line, fileName: #file)
                }
            } else {
                EVLog(text: "Bad value: \(String(describing: newValue))", line: #line, fileName: #file)
            }
        }
    }
    
    private var state: String?
    private let userAccount = "twitch"
    private let loadingAuthTokenKey = "loadingOauthToken"
    private var authenticationSession: SFAuthenticationSession?
    
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
    //log in and process right here, need to use query builder and verify new paths
    public func login() throws {
        let defaults = UserDefaults.standard
        if !defaults.bool(forKey: loadingAuthTokenKey) && authToken == nil {
            state = NSUUID().uuidString
            guard let clientID = clientID, let redirectURI = redirectURI, let scopes = scopes, let state = state else {
                throw AuthorizationError.invalidQueryParameters(desc: "Must define values for the Client Id, Redirect URI, and scopes")
            }
            
            let authPath = "\(String(describing: TwitchEndpoints.authentication.construct()))?response_type=code&client_id=\(clientID)&redirect_uri=\(redirectURI)&scope=\(scopes)&state=\(state)"
            guard let authURL = URL(string: authPath) else {
                EVLog(text: "Invalid auth url: \(authPath)", line: #line, fileName: #file)
                throw AuthorizationError.invalidAuthURL(desc: "Authorization url is invalid, please check your values for the Redirect URI, Client Id, and scopes", url: authPath)
            }
            defaults.set(true, forKey: loadingAuthTokenKey)
            processAuthorization(for: authURL)
        } else {
            EVLog(text: "Authorization token exits or authorization is in progress...no need to authorization again", line: #line, fileName: #file)
        }
    }
    
    private func processAuthorization(for url: URL) {
        self.authenticationSession = SFAuthenticationSession(url: url, callbackURLScheme: nil, completionHandler: { (callback: URL?, error: Error?) in
            guard error == nil, let successURL = callback else {
                EVLog(text: "Error processing oauth request", line: #line, fileName: #file)
                return
            }
            let defaults = UserDefaults.standard
            defaults.set(false, forKey: self.loadingAuthTokenKey)
            let components = URLComponents(url: successURL, resolvingAgainstBaseURL: false)
            guard let queryItems = components?.queryItems else { return }
            
            let token = queryItems.filter { $0.name.lowercased() == "id_token" }.first?.value
            let scope = queryItems.filter { $0.name.lowercased() == "scope" }.first?.value?.split(separator: " ").map { String($0) }
            self.credentials = Credentials(accessToken: token, scope: scope)
        })
        authenticationSession?.start()
    }
    
    /**
     Removes users credentials from the app forcing re-authentication with Twitch
     
     - throws: 'LocksmithError' see: https://github.com/matthewpalmer/Locksmith
    */
    public func logout() throws {
        authFailed()
        try Locksmith.deleteDataForUserAccount(userAccount: userAccount)
    }
    
    ///Can be called to ensure all settings are properly updated on authentication failure.
    public func authFailed() {
        let defaults = UserDefaults.standard
        defaults.set(false, forKey: loadingAuthTokenKey)
    }
}


