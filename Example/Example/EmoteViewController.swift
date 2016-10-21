//
//  EmoteViewController.swift
//  Example
//
//  Created by Eric Vennaro on 10/21/16.
//  Copyright © 2016 Eric Vennaro. All rights reserved.
//

import UIKit
import TwitchAPIWrapper

class EmoteViewController: UIViewController {
    
    fileprivate lazy var emotePresenter: EmotePresenter = {
        return EmotePresenter(dataSource: self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //userPresenter.get(user: "test_user1")
        do {
            try emotePresenter.getUsersEmoticons(for: "test_user1")
        } catch {
            NSLog("error")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

//MARK: UserPresenterDataSource
extension EmoteViewController: TwitchAPIDataSource {
    public func set<T>(resource: T) {
        if let emotes = resource as? [Emote] {
            print(emotes)
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

