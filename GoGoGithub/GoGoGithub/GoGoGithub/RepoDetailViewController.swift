//
//  RepoDetailViewController.swift
//  GoGoGithub
//
//  Created by Erica Winberry on 11/2/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

import UIKit

class RepoDetailViewController: UIViewController {

    @IBOutlet weak var repoName: UILabel!
    
    @IBOutlet weak var repoCreated: UILabel!
    
    @IBOutlet weak var repoUpdated: UILabel!
    
    @IBOutlet weak var repoLanguage: UILabel!
    
    @IBOutlet weak var repoDescription: UILabel!
    
    @IBOutlet weak var repoWatchers: UILabel!
    
    
    var repo: Repository!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        repoName.text = repo.name
        repoCreated.text = repo.created
        repoUpdated.text = repo.updated
        repoLanguage.text = repo.language
        if let description = repo.description {
            repoDescription.text = description
        }
        if let watchers = repo.watchers {
            repoWatchers.text = "Watchers: \(watchers)"
        }
    }

    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
