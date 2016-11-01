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
    
    // fallable initializer: if everything not there, will return nil
    init?(json: [String: Any]) {
        if let name = json["name"] as? String {
            self.name = name
            // these two could be outside the if let, but don't care about them unless there's a name
            self.description = json["description"] as? String
            self.language = json["language"] as? String
        } else {
            return nil
        }
    }
}
