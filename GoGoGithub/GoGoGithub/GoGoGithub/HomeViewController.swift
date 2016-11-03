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
    
    let customTransition = CustomTransition()
    
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
    
    // MARK: Override functions
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpTableView()
        self.searchBar.delegate = self
        
        let nib = UINib(nibName: "repoCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: RepoTableViewCell.identifier)
        
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        var currentReposArray = [Repository]()
        
        if self.filterResults.isEmpty {
            currentReposArray = allRepos
        } else {
            currentReposArray = filterResults
        }
        
        let selectedIndex = tableView.indexPathForSelectedRow!.row
        let selectedRepo = currentReposArray[selectedIndex]
        
        if segue.identifier == RepoDetailViewController.identifier {
            
            if let destinationController = segue.destination as? RepoDetailViewController {
                destinationController.transitioningDelegate = self
                destinationController.repo = selectedRepo
            }
        }

    }
    
    // MARK: Other functions
    
    func setUpTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.tableView.estimatedRowHeight = 50
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    // This will be used later to update repos after a successful login.
    func update() {
        
        GitHubService.shared.fetchRepos { (repositories) in
            
            if let repositories = repositories {
                if !self.allRepos.isEmpty {
                    self.allRepos.removeAll()
                }
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

        cell.repo = currentRepo
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: RepoDetailViewController.identifier, sender: nil)
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let text = searchText.lowercased()
        if text != "" {
            filterResults = self.allRepos.filter { $0.name.lowercased().contains(text) }
        } else {
            self.tableView.reloadData()
            searchBar.resignFirstResponder()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

extension HomeViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return self.customTransition
    }
}
