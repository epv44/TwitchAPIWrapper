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
        let userRequest = UserRequest(id: nil, login: ["evennaro1"])
        twitchService.gen(forRequest: userRequest) { (result: Result<UserResponse>) in
            switch result {
            case .success(let r):
            print(r.users[0])
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
