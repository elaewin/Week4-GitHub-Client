//
//  CustomTransition.swift
//  GoGoGithub
//
//  Created by Erica Winberry on 11/2/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

import UIKit

class CustomTransition: NSObject {

    var duration: TimeInterval
    
    init(duration: TimeInterval = 0.75) {
        self.duration = duration
    }
    
}

extension CustomTransition: UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return self.duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        // already have fromVC via transitionContext, have to add toVC
        guard let toViewController = transitionContext.viewController(forKey: .to) else { return }
        
        transitionContext.containerView.addSubview(toViewController.view)
        
        toViewController.view.alpha = 0.0
        
        // animation duration should match transition duration to look fluid.
        UIView.animate(withDuration: self.duration, animations: {
            
            toViewController.view.alpha = 1.0
            
        }, completion: { (finished) in
            transitionContext.completeTransition(true)
        })
    }
    
}
