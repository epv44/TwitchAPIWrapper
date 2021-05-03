//
//  GameViewController.swift
//  Example
//
//  Created by Eric Vennaro on 10/21/16.
//  Copyright © 2016 Eric Vennaro. All rights reserved.
//

import UIKit
import TwitchAPIWrapper

class GameViewController: UIViewController {

    private let twitchService = TwitchService()
    override func viewDidLoad() {
        super.viewDidLoad()
//        let request = GameAnalyticsRequest(
//            gameID: "493057",
//            endedAt: "2018-03-01T00:00:00Z",
//            startedAt: "2018-01-01T00:00:00Z")
        let request = try! StartCommercialRequest(broadcasterID: "41245072", length: 60)
        twitchService.startCommercial(forRequest: request) { result in
            switch result {
            case .success(let r):
                print(r)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
