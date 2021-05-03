//
//  ViewController.swift
//  Example
//
//  Created by Eric Vennaro on 10/11/16.
//  Copyright © 2016 Eric Vennaro. All rights reserved.
//

import AuthenticationServices
import TwitchAPIWrapper
import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    fileprivate let consumableEndpoints = ["User", "Clips", "Games", "Debug - Logout"]
    fileprivate let segueIdentifiers = ["UserSegue", "EmoteSegue", "GamesSegue"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let path = Bundle.main.path(forResource: "Environment", ofType: "plist") {
            let configuration = NSDictionary(contentsOfFile: path) as! [String : AnyObject]
            TwitchAuthorizationManager.sharedInstance.clientID = configuration["clientID"] as? String
            TwitchAuthorizationManager.sharedInstance.redirectURI = configuration["redirectURI"] as? String
            TwitchAuthorizationManager.sharedInstance.scopes = configuration["scopes"] as? String
            TwitchAuthorizationManager.sharedInstance.clientSecret = configuration["clientSecret"] as? String
            TwitchAuthorizationManager.sharedInstance.contextProvider = self
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
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//MARK: UITableViewDelegate
extension ViewController: UITableViewDelegate {
    //This is not the best way to perform navigation - In a production app change this
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if consumableEndpoints[indexPath.row] == "Debug - Logout" {
            try! TwitchAuthorizationManager.sharedInstance.logout()
        } else {
            performSegue(withIdentifier: segueIdentifiers[indexPath.row], sender: nil)
        }
    }
}

//MARK: UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return consumableEndpoints.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EVExample", for: indexPath) as UITableViewCell
        cell.textLabel?.text = consumableEndpoints[indexPath.row]
        return cell
    }
}

extension ViewController: ASWebAuthenticationPresentationContextProviding {
    func presentationAnchor(for session: ASWebAuthenticationSession)
    -> ASPresentationAnchor {
//      let window = UIApplication.shared.windows.first { $0.isKeyWindow }
      return self.view.window ?? ASPresentationAnchor()
    }
  }


