//
//  ClipViewController.swift
//  Example
//
//  Created by Eric Vennaro on 10/21/16.
//  Copyright © 2016 Eric Vennaro. All rights reserved.
//

import UIKit
import TwitchAPIWrapper

class ClipViewController: UIViewController {

    private let twitchService = TwitchService()
    override func viewDidLoad() {
        super.viewDidLoad()
        let request = try! ClipRequest(id: "AwkwardHelplessSalamanderSwiftRage", gameID: nil, broadcasterID: nil)
        twitchService.clips(forRequest: request) { result in
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
