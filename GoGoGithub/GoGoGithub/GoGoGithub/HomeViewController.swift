//
//  HomeViewController.swift
//  GoGoGithub
//
//  Created by Erica Winberry on 11/1/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        update()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // This will be used later to update repos after a successful login.
    func update() {
        
        GitHubService.shared.fetchRepos { (repositories) in
            
            if let repositories = repositories {
                for repository in repositories {
                    print(repository.name)
                }
            }
        }
    }
    
}
