//
//  TwitchAuthorizationManager
//  TwitchAPIWrapper
//
//  Created by Eric Vennaro on 10/11/16.
//
// Note that the Twitch API never has tokens expire, so if a token exists it is valid indefinitely

import Foundation
import KeychainAccess
import UIKit
import AuthenticationServices

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
@available(iOS 13.0, *)
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
            guard let token = ((try? keychain.get(twitchAccessToken)) as String??) else {
                EVLog(text: "Bad retrieval of access token", line: #line, fileName: #file)
                return nil
            }
            return token
        }
    }
    
    ///Scopes authorized from server **Read Only**.
    public var authorizedScopes: [String]? {
        get {
            guard let data = (((try? keychain.getData(twitchScopes)) as Data??)),
                  let scopesData = data,
                  let scopes = (try? JSONSerialization.jsonObject(with: scopesData, options: [])) as? [String] else {
                EVLog(text: "Bad retrieval of scope", line: #line, fileName: #file)
                return nil
            }
            
            return scopes
        }
    }
    
    ///View controller that will present the webview for authorization, the "app context"
    public var contextProvider: UIViewController?
    
    ///Credentials from the server, contains authorized scopes and the auth token this can be used to set the auth token without going through
    ///the built in authorization flow
    public var credentials: Credentials? {
        get {
            guard let authToken = authToken, let scopes = authorizedScopes else { return nil }
            return Credentials(accessToken: authToken, scope: scopes)
        }
        set {
            if let valueToSave = newValue {
                guard let accessToken = valueToSave.accessToken,
                      let scopes = valueToSave.scope else {
                    EVLog(text: "Error occured saving value to the keychain, credentials object is incomplete", line: #line, fileName: #file)
                    return
                }
                guard let scopesData = try? JSONSerialization.data(withJSONObject: scopes, options: []) else {
                    EVLog(text: "Error occured saving value to the keychain, credentials object is incomplete", line: #line, fileName: #file)
                    return
                }
                // try to remove first, this may fail that should be ok
                do {
                    try keychain.remove(twitchAccessToken)
                    try keychain.remove(twitchScopes)
                } catch {
                    EVLog(text: "Warn: removing keychain objects failed", line: #line, fileName: #file)
                }
                do{
                    try keychain.set(accessToken, key: twitchAccessToken)
                    try keychain.set(scopesData, key: twitchScopes)
                } catch {
                    EVLog(text: "Unknown error occured saving value to the keychain", line: #line, fileName: #file)
                }
            } else {
                EVLog(text: "Bad value: \(String(describing: newValue))", line: #line, fileName: #file)
            }
        }
    }
    
    private let userAccount = "twitch"
    private let loadingAuthTokenKey = "loadingOauthToken"
    private let keychain = Keychain(service: "com.vennaro.TwitchAPIWrapper")
    private let twitchAccessToken = "twitchAccessToken"
    private let twitchScopes = "twitchScopes"
    private var authenticationSession: ASWebAuthenticationSession?
    
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
        if authToken == nil {
            let state = NSUUID().uuidString
            guard let clientID = clientID, let redirectURI = redirectURI, let scopes = scopes else {
                throw AuthorizationError.invalidQueryParameters(desc: "Must define values for the Client Id, Redirect URI, and scopes")
            }
            
            let authPath = "\(TwitchEndpoints.authentication.construct()?.absoluteString ?? "")?response_type=token&client_id=\(clientID)&redirect_uri=\(redirectURI)&scope=\(scopes)&state=\(state)&force_verify=true"
            guard let authURL = URL(string: authPath) else {
                EVLog(text: "Invalid auth url: \(authPath)", line: #line, fileName: #file)
                throw AuthorizationError.invalidAuthURL(desc: "Authorization url is invalid, please check your values for the Redirect URI, Client Id, and scopes", url: authPath)
            }
            contextProvider?.present(TWAuthWebViewController(delegate: self, redirectURI: redirectURI, authURL: authURL, state: state), animated: true, completion: nil)
            
        } else {
            EVLog(text: "Authorization token exits no need to authorization again", line: #line, fileName: #file)
        }
    }
    
    /**
     Removes users credentials from the app forcing re-authentication with Twitch
     
     - throws: `Error` see: https://github.com/kishikawakatsumi/KeychainAccess
    */
    public func logout() throws {
        try keychain.remove(twitchAccessToken)
        try keychain.remove(twitchScopes)
    }
}

//MARK: - TWAuthWebViewDelegate
extension TwitchAuthorizationManager: TWAuthWebViewDelegate {
    func completeAuthentication(_ vc: UIViewController, token: String, scopes: [String]) {
        credentials = Credentials(accessToken: token, scope: scopes)
    }
}

