//
//  RepoTableViewCell.swift
//  GoGoGithub
//
//  Created by Erica Winberry on 11/1/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

import UIKit

class RepoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var repoNameLabel: UILabel!
    
    @IBOutlet weak var repoLanguageLabel: UILabel!
    
    @IBOutlet weak var repoDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setupRepoCell() {
        
    }
    
}
