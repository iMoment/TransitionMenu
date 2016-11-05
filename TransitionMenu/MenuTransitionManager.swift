//
//  MenuTransitionManager.swift
//  TransitionMenu
//
//  Created by Stanley Pan on 05/11/2016.
//  Copyright © 2016 Stanley Pan. All rights reserved.
//

import UIKit

class MenuTransitionManager: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
    
    fileprivate var presenting = false
    
    // MARK: UIViewControllerAnimatedTransitioning protocol methods
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let container = transitionContext.containerView

        let screens: (from: UIViewController, to: UIViewController) = (transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)!, transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!)
        
        let menuViewController = !self.presenting ? screens.from as! MenuViewController : screens.to as! MenuViewController
        let bottomViewController = !self.presenting ? screens.to as UIViewController : screens.from as UIViewController
        
        let menuView = menuViewController.view
        let bottomView = bottomViewController.view
        
        // TODO: 2D transitions for items in MenuViewController
        let offstageLeft = CGAffineTransform(translationX: -150, y: 0)
        let offstageRight = CGAffineTransform(translationX: 150, y: 0)
        
        // Prepare the menu
        if (self.presenting){
            menuView?.alpha = 0
            
            menuViewController.textImageView.transform = offstageLeft
            menuViewController.textLabel.transform = offstageLeft
            
            menuViewController.photoImageView.transform = offstageRight
            menuViewController.photoLabel.transform = offstageRight
        }
        
        container.addSubview(bottomView!)
        container.addSubview(menuView!)
        
        let duration = self.transitionDuration(using: transitionContext)
        
        // Perform animation
        UIView.animate(withDuration: duration, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.8, options: .curveEaseOut, animations: {
            
            if (self.presenting) {
                menuView?.alpha = 1
                
                menuViewController.textImageView.transform = CGAffineTransform.identity
                menuViewController.textLabel.transform = CGAffineTransform.identity
                
                menuViewController.photoImageView.transform = CGAffineTransform.identity
                menuViewController.photoLabel.transform = CGAffineTransform.identity
            } else {
                menuView?.alpha = 0
                
                menuViewController.textImageView.transform = offstageLeft
                menuViewController.textLabel.transform = offstageLeft
                
                menuViewController.photoImageView.transform = offstageRight
                menuViewController.photoLabel.transform = offstageRight
            }
            
        }, completion: { finished in
            // Tell transitionContext object that we've finished animating
            transitionContext.completeTransition(true)
            UIApplication.shared.keyWindow?.addSubview(screens.to.view)
        })
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    // MARK: UIViewControllerTransitioningDelegate protocol methods
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = true
        return self
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = false
        return self
    }
}
