//
//  RepoDetailViewController.swift
//  GoGoGithub
//
//  Created by Erica Winberry on 11/2/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

import UIKit
import WebKit

class RepoDetailViewController: UIViewController {

    @IBOutlet weak var repoName: UILabel!
    
    @IBOutlet weak var repoCreated: UILabel!
    
    @IBOutlet weak var repoUpdated: UILabel!
    
    @IBOutlet weak var repoLanguage: UILabel!
    
    @IBOutlet weak var repoDescription: UILabel!
    
    @IBOutlet weak var repoWatchers: UILabel!
    
    @IBOutlet weak var readMeView: UIView!
    
    var repo: Repository!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        let dateFormatter = ISO8601DateFormatter()
        
        repoName.text = repo.name
        if let created = repo.created {
            let createdDate = dateFormatter.date(from: created)
            repoCreated.text = "Created: \(dateFormatter.string(from: createdDate!))"
        }
        if let updated = repo.updated { repoUpdated.text = "Last Updated: \(updated)" }
        if let language = repo.language { repoLanguage.text = "Primary Language Used: \(language)" }
        if let description = repo.description { repoDescription.text = description }
        if let watchers = repo.watchers { repoWatchers.text = "Watchers: \(watchers)" }
    }

    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "webViewControllerSegue" {
            if let destination = segue.destination as? WebViewController {
                let owner = repo.owner
                GitHubService.shared.fetchReadMe(owner: owner, repo: repo.name) { (readme) in
                    destination.webURL = readme!.url
                }
            }
        }
    }
}
