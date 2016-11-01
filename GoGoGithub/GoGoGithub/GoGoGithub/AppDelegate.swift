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

    var authController: AuthViewController?
    var homeController: HomeViewController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        checkAuthStatus()
        
        return true
    }

    // OPEN URL
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        
//        let code = try? GitHubService.shared.codeFrom(url: url)
        
        GitHubService.shared.tokenRequestFor(url: url, options: .userDefaults) { (success) in
            if let authController = self.authController, let homeController = self.homeController {
                authController.dismissAuthController()
//                homeController.update()
            }
        }
        return true
    }

    func checkAuthStatus() {
        
        if let token = UserDefaults.standard.getAccessToken() {
            print(token)
        } else {
            // could separate this section out into 'presentViewController' func
            // all chained options must pass to get into if statement
            if let homeViewController = self.window?.rootViewController as? HomeViewController, let storyboard = homeViewController.storyboard {
                
                // this will put the AuthViewController on screen
                if let authViewController = storyboard.instantiateViewController(withIdentifier: AuthViewController.identifier) as? AuthViewController {
                    
                    // adding this func's instance of authVC as child of this func's instance of homeVC (NOTE: lower camelCase!)
                    homeViewController.addChildViewController(authViewController)
                    homeViewController.view.addSubview(authViewController.view)
                    
                    authViewController.didMove(toParentViewController: homeViewController)
                    
                    self.authController = authViewController
                    self.homeController = homeViewController
                }
            }
        }
    }
    
}









