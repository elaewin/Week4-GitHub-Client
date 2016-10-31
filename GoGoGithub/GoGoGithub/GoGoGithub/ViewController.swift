//
//  ViewController.swift
//  GoGoGithub
//
//  Created by Erica Winberry on 10/31/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBAction func requestTokenPressed(_ sender: AnyObject) {
        
        let parameters = ["scope": "user:email,repo"]
        
        GitHubService.shared.oAuthWith(parameters: parameters)
    }
    
    @IBAction func printTokenPressed(_ sender: AnyObject) {
        
        if let token = UserDefaults.standard.getAccessToken() {
            print("Access token is: \(token)")
        } else {
            print("No token found!")
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

