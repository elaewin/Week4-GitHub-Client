//
//  GitHubService.swift
//  GoGoGithub
//
//  Created by Erica Winberry on 10/31/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

import UIKit

let kBaseUrlString = "https://github.com/login/oauth"

enum GitHubOAuthError: Error {
    case extractingCode(String)
}



class GitHubService {
    
    static let shared = GitHubService()
    
    private init() {}
    
    func oAuthWith(parameters: [String: String]) {
        
        var parameterString = String()
        
        for(key, value) in parameters {
            parameterString += "&\(key)=\(value)"
        }
        
        if let requestURL = URL(string: "\(kBaseUrlString)/authorize?client_id=\(kGitHubClientID)\(parameterString)") {
            print("Request URL: \(requestURL.absoluteString)")
            
            UIApplication.shared.open(requestURL)
        }
    }
    
    func codeFrom(url: URL) throws -> String {
        guard let code = url.absoluteString.components(separatedBy: "=").last else {
            throw GitHubOAuthError.extractingCode("Temporary code not found in string. See codeFrom(url:).")
        }
        
        return code
    }
    
}
