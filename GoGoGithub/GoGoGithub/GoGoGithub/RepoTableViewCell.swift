//
//  RepoTableViewCell.swift
//  GoGoGithub
//
//  Created by Erica Winberry on 11/1/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

import UIKit

class RepoTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var repoName: UILabel!
    
    @IBOutlet weak var repoLanguage: UILabel!
    
    @IBOutlet weak var repoDescription: UILabel!
    
    var repo: Repository! {
        didSet {
            self.repoName.text = repo.name
            if repo.language != nil {
                self.repoLanguage.text = repo.language
            }
            if repo.description != nil {
                self.repoDescription.text = repo.description
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
