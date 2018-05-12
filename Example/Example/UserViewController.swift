//
//  UserViewController.swift
//  Example
//
//  Created by Eric Vennaro on 10/17/16.
//  Copyright © 2016 Eric Vennaro. All rights reserved.
//

import UIKit
import TwitchAPIWrapper

class UserViewController: UIViewController {
    
    private let twitchService = TwitchService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let userRequest = UserRequest()
        twitchService.users(forRequest: userRequest) { result in
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
