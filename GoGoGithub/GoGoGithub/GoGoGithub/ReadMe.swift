//
//  ReadMe.swift
//  GoGoGithub
//
//  Created by Erica Winberry on 11/3/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

import UIKit

class ReadMe {
    
    let url: String
    
    init?(json: [String:Any]) {
        if let url = json["html_url"] as? String {
            self.url = url
        } else {
            return nil
        }
    }    
}


/*
 {
 "type": "file",
 "encoding": "base64",
 "size": 5362,
 "name": "README.md",
 "path": "README.md",
 "content": "encoded content ...",
 "sha": "3d21ec53a331a6f037a91c368710b99387d012c1",
 "url": "https://api.github.com/repos/octokit/octokit.rb/contents/README.md",
 "git_url": "https://api.github.com/repos/octokit/octokit.rb/git/blobs/3d21ec53a331a6f037a91c368710b99387d012c1",
 "html_url": "https://github.com/octokit/octokit.rb/blob/master/README.md",
 "download_url": "https://raw.githubusercontent.com/octokit/octokit.rb/master/README.md",
 "_links": {
 "git": "https://api.github.com/repos/octokit/octokit.rb/git/blobs/3d21ec53a331a6f037a91c368710b99387d012c1",
 "self": "https://api.github.com/repos/octokit/octokit.rb/contents/README.md",
 "html": "https://github.com/octokit/octokit.rb/blob/master/README.md"
 }
 }
 */
