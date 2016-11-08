//
//  WebViewController.swift
//  GoGoGithub
//
//  Created by Erica Winberry on 11/3/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    let webView = WKWebView()
    
    var webURL: String? {
        didSet{
            // if let because URL has falliable initializer
            if let url = URL(string: webURL!) {
                let request = URLRequest(url: url)
                self.webView.load(request)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // will make this the full screen of this VC.
        webView.frame = self.view.frame
        self.view.addSubview(webView)
        
    }
}
