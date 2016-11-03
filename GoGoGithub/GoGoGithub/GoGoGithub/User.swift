//
//  User.swift
//  GoGoGithub
//
//  Created by Erica Winberry on 11/3/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

import UIKit

class User {
    
    let login: String
    let webUrl: String
    let avatarUrl: String?
    
    init?(json: [String: Any]) {
        if let login = json["login"] as? String, let webUrl = json["html_url"] as? String {
            self.login = login
            self.webUrl = webUrl
            self.avatarUrl = json["avatar_url"] as? String
        } else {
            return nil
        }
    }
}


/* {
    "total_count": 12,
    "incomplete_results": false,
    "items": [
    {
    "login": "mojombo",
    "id": 1,
    "avatar_url": "https://secure.gravatar.com/avatar/25c7c18223fb42a4c6ae1c8db6f50f9b?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png",
    "gravatar_id": "",
    "url": "https://api.github.com/users/mojombo",
    "html_url": "https://github.com/mojombo",
    "followers_url": "https://api.github.com/users/mojombo/followers",
    "subscriptions_url": "https://api.github.com/users/mojombo/subscriptions",
    "organizations_url": "https://api.github.com/users/mojombo/orgs",
    "repos_url": "https://api.github.com/users/mojombo/repos",
    "received_events_url": "https://api.github.com/users/mojombo/received_events",
    "type": "User",
    "score": 105.47857
    }
    ]
} */
