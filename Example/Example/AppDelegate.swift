//
//  AppDelegate.swift
//  Example
//
//  Created by Eric Vennaro on 10/11/16.
//  Copyright © 2016 Eric Vennaro. All rights reserved.
//

import UIKit
import TwitchAPIWrapper

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        if url.scheme == "evtwitchwrapper" {
            TwitchAuthorizationManager.sharedInstance.processOauthResponse(with: url,
                completion: { (result) in
                    switch result {
                    case let .failure(error):
                        //Optional, will ensure that authorization is recorded as a failure
                        TwitchAuthorizationManager.sharedInstance.authFailed()
                        switch error {
                        case let AuthorizationError.invalidAuthURL(desc, url):
                            NSLog(desc + url)
                        case let AuthorizationError.invalidQueryParameters(desc):
                            NSLog(desc)
                        case let AuthorizationError.invalidURLResponse(url):
                            NSLog("\(url)")
                        case let AuthorizationError.noCode(desc):
                            NSLog(desc)
                        case let AuthorizationError.unableToParseJSON(json):
                            NSLog(json)
                        case let AuthorizationError.unknownError(error):
                            NSLog(error.localizedDescription)
                        case ParsingError.cannotParseJSONArray:
                            NSLog("Error parsing JSON Array")
                        case ParsingError.invalidJSONData:
                            NSLog("Invalid JSON Data")
                        case ParsingError.cannotParseJSONDictionary:
                            NSLog("Error parsing JSON Dictionary")
                        case ParsingError.unsupportedType:
                            NSLog("Type you are trying to parse is currently unsupported")
                        case let NetworkJSONServiceError.networkError(error):
                            NSLog(error.localizedDescription)
                        case NetworkJSONServiceError.noData:
                            NSLog("No data returned")
                        default:
                            NSLog("Unknown error occurred")
                        }
                        //case let .success(credentials)
                    case .success(_):
                        //returns credential object; however, values are stored securly in keychain and can be accessed as:
                        print(TwitchAuthorizationManager.sharedInstance.authToken)
                    }
                }
            )
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }

    func applicationWillTerminate(_ application: UIApplication) {

    }
    
    
    // Mark: - Twitch Auth Setup
    override init() {
        super.init()
        var configuration: [String: AnyObject]
        if let path = Bundle.main.path(forResource: "Environment", ofType: "plist") {
            configuration = NSDictionary(contentsOfFile: path) as! [String : AnyObject]
            TwitchAuthorizationManager.sharedInstance.clientID = configuration["clientID"] as? String
            TwitchAuthorizationManager.sharedInstance.redirectURI = configuration["redirectURI"] as? String
            TwitchAuthorizationManager.sharedInstance.scopes = configuration["scopes"] as? String
            TwitchAuthorizationManager.sharedInstance.clientSecret = configuration["clientSecret"] as? String
            if !TwitchAuthorizationManager.sharedInstance.hasOAuthToken() {
                do {
                    try TwitchAuthorizationManager.sharedInstance.login()
                } catch AuthorizationError.invalidURLResponse(let url) {
                    NSLog("error thrown: \(url)")
                } catch AuthorizationError.unableToParseJSON(let json) {
                    NSLog(json)
                } catch AuthorizationError.invalidQueryParameters(let d) {
                    NSLog(d)
                } catch AuthorizationError.invalidAuthURL(let d, let url) {
                    NSLog("\(d), url: \(url)")
                } catch AuthorizationError.unknownError(let e) {
                    NSLog(e.localizedDescription)
                } catch {
                    NSLog("unknown exception occured")
                }
            } else {
                NSLog("OAuth Token exists, no need to authorize")
            }
        } else {
            NSLog("Error occured when initializing environment")
            configuration = [String : AnyObject]()
        }
    }
}

