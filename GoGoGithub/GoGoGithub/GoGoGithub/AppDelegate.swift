//
//  AppDelegate.swift
//  GoGoGithub
//
//  Created by Erica Winberry on 10/31/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // OPEN URL
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        
//        let code = try? GitHubService.shared.codeFrom(url: url)
        
        GitHubService.shared.tokenRequestFor(url: url, options: .userDefaults) { (success) in
            
            
            
        }
        
        return true
        
    }


}

