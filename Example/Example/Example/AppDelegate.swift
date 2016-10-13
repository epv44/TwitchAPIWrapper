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
        print(url)
        do {
            try TwitchAuthorizationManager.sharedInstance.processOauthResponse(with: url)
        } catch AuthorizationError.invalidURLResponse {
            print("error thrown")
        } catch AuthorizationError.unableToParseJSON {
            print("invalid json parsing")
        } catch AuthorizationError.invalidQueryParameters(let d) {
            NSLog(d)
        } catch AuthorizationError.invalidAuthURL(let d, let url) {
            NSLog("\(d), url: \(url)")
        } catch AuthorizationError.unknownError(let e) {
            NSLog(e.localizedDescription)
        } catch {
            NSLog("unknown exception occured")
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
            do {
                try TwitchAuthorizationManager.sharedInstance.login()
            } catch AuthorizationError.invalidURLResponse(let url) {
                print("error thrown: \(url)")
            } catch AuthorizationError.unableToParseJSON(let json) {
                print(json)
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
            print("Error occured when initializing environment")
            configuration = [String : AnyObject]()
        }
    }
}

