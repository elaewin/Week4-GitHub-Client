//
//  UserSearchViewController.swift
//  GoGoGithub
//
//  Created by Erica Winberry on 11/3/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

import UIKit
import SafariServices

class UserSearchViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var searchedUsers = [User]() {
        didSet{
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.searchBar.delegate = self
        
        // Do any additional setup after loading the view.
    }
}

// These are funcs we don't call ourselves.
extension UserSearchViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.searchedUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let currentUser = self.searchedUsers[indexPath.row]
        cell.textLabel?.text = currentUser.login
        return cell
    }
    
    // helper func for didSelectRowAt
    func presentWebControllerWith(url: String) {
        
        let webViewController = WebViewController()
        webViewController.webURL = url
        
        self.present(webViewController, animated: true, completion: nil)
    }
    
    func presentSafariViewController(url: String) {
        
        let safariViewController = SFSafariViewController(url: URL(string: url)!)
        
        self.present(safariViewController, animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedUser = self.searchedUsers[indexPath.row]
        
//        presentWebControllerWith(url: selectedUser.webUrl)
        presentSafariViewController(url: selectedUser.webUrl)
    }
}

extension UserSearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = searchBar.text {
            GitHubService.shared.searchUsersWith(searchTerm: searchText, completion: { (results) in
                if let results = results {
                    self.searchedUsers = results
                }
            })
        }
        self.searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if !searchText.isValid {
            let lastIndex = searchText.index(before: searchText.endIndex)
            searchBar.text = searchText.substring(to: lastIndex)
        } else {
            searchBar.showsSearchResultsButton = true
        }
        
    }
}


