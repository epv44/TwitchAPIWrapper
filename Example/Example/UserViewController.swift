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
    
    fileprivate lazy var userPresenter: UserPresenter = {
        return UserPresenter(dataSource: self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //userPresenter.get(user: "test_user1")
        do {
            try userPresenter.getCurrentUser()
        } catch {
            NSLog("error")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

//MARK: UserPresenterDataSource
extension UserViewController: TwitchAPIDataSource {
    public func set<T>(resource: T) {
        if let user = resource as? User {
            print(user.displayName)
        } else {
            NSLog("Invalid Generic Resource")
        }
    }
    
    func startLoading(for resource: TwitchResource) {
        NSLog("Started Loading: \(resource)")
    }
    
    func finishLoading(for resource: TwitchResource) {
        NSLog("Finished Loading: \(resource)")
    }
    
    func handle(error: Error) {
        NSLog("Error")
    }
}
