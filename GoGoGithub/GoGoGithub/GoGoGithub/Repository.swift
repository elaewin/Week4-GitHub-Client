//
//  Repository.swift
//  GoGoGithub
//
//  Created by Erica Winberry on 11/1/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

import Foundation

class Repository {
    
    let name: String
    let description: String?
    let language: String?
    let watchers: Int?
    let created: String?
    let updated: String?
    
    // fallable initializer: if everything not there, will return nil
    init?(json: [String: Any]) {
        if let name = json["name"] as? String {
            self.name = name
            // these two could be outside the if let, but don't care about them unless there's a name
            self.description = json["description"] as? String
            self.language = json["language"] as? String
            self.watchers = json["watchers_count"] as? Int
            self.created = json["created_at"] as? String
            self.updated = json["updated_at"] as? String
        } else {
            return nil
        }
    }
}
