//
//  ReadMeView.swift
//  GoGoGithub
//
//  Created by Erica Winberry on 11/3/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

import UIKit
import WebKit

class ReadMeView: UIView {

    var webView = WKWebView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.webView.frame = self.frame
        
        self.addSubview(webView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
