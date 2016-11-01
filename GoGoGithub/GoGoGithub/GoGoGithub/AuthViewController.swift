//
//  AuthViewController.swift
//  GoGoGithub
//
//  Created by Erica Winberry on 11/1/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {

    
    @IBAction func loginButtonPressed(_ sender: Any) {
        
        let parameters = ["scope": "user:email,repo"]
        
        GitHubService.shared.oAuthWith(parameters: parameters)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
