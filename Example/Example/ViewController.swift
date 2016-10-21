//
//  ViewController.swift
//  Example
//
//  Created by Eric Vennaro on 10/11/16.
//  Copyright © 2016 Eric Vennaro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    fileprivate let consumableEndpoints = ["User", "Emote"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
        switch indexPath.row {
        case 0:
            performSegue(withIdentifier: "UserSegue", sender: nil)
        case 1:
            performSegue(withIdentifier: "EmoteSegue", sender: nil)
        default:
            NSLog("Invalid")
            break
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

