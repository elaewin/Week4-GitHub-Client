//
//  Extensions.swift
//  GoGoGithub
//
//  Created by Erica Winberry on 10/31/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

import UIKit

extension UserDefaults {
    
    func getAccessToken() -> String? {
        
        return self.string(forKey: "access_token")
    }
    
    func save(accessToken: String) -> Bool {
        
        self.set(accessToken, forKey: "access_token")
        
        return synchronize()
    }
    
}
