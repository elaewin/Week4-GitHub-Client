//
//  HomeViewController.swift
//  GoGoGithub
//
//  Created by Erica Winberry on 11/1/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var allRepos = [Repository]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var filterResults = [Repository]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = self
        
        self.tableView.estimatedRowHeight = 50
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        self.tableView.delegate = self
        
        self.searchBar.delegate = self
        
//        update()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        update()
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
                    self.allRepos.append(repository)
                }
            }
        }
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchBar.text != "" {
            return self.filterResults.count
        }
        return self.allRepos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "RepoTableViewCell", for: indexPath) as! RepoTableViewCell
        
        var currentRepo: Repository
        
        if searchBar.text != "" {
            currentRepo = filterResults[indexPath.row]
        } else {
            currentRepo = allRepos[indexPath.row]
        }
        
        cell.repoNameLabel.text = currentRepo.name
        cell.repoLanguageLabel.text = currentRepo.language
        cell.repoDescriptionLabel.text = currentRepo.description
        
        return cell
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let text = searchText.lowercased()
        filterResults = self.allRepos.filter { $0.name.lowercased().contains(text) }
        
        self.tableView.reloadData()
    }
}
