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


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?)
        -> Bool {
            
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
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

