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
        
        // Prepare the menu
        if (self.presenting) {
            offStageMenuController(menuViewController)
        }
        
        container.addSubview(bottomView!)
        container.addSubview(menuView!)
        
        let duration = self.transitionDuration(using: transitionContext)
        
        // Perform animation
        UIView.animate(withDuration: duration, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.8, options: .curveEaseOut, animations: {
            
            if (self.presenting) {
                self.onStageMenuController(menuViewController)
            } else {
                self.offStageMenuController(menuViewController)
            }
            
        }, completion: { finished in
            // Tell transitionContext object that we've finished animating
            transitionContext.completeTransition(true)
            UIApplication.shared.keyWindow?.addSubview(screens.to.view)
        })
    }
    
    func offStageMenuController(_ menuViewController: MenuViewController) {
        // 2D transitions for items in MenuViewController
        let offstageLeft = CGAffineTransform(translationX: -150, y: 0)
        let offstageRight = CGAffineTransform(translationX: 150, y: 0)
        
        menuViewController.view.alpha = 0
        
        menuViewController.textImageView.transform = offstageLeft
        menuViewController.textLabel.transform = offstageLeft
        
        menuViewController.quoteImageView.transform = offstageLeft
        menuViewController.quoteLabel.transform = offstageLeft
        
        menuViewController.chatImageView.transform = offstageLeft
        menuViewController.chatLabel.transform = offstageLeft
        
        menuViewController.photoImageView.transform = offstageRight
        menuViewController.photoLabel.transform = offstageRight
        
        menuViewController.linkImageView.transform = offstageRight
        menuViewController.linkLabel.transform = offstageRight
        
        menuViewController.audioImageView.transform = offstageRight
        menuViewController.audioLabel.transform = offstageRight
    }
    
    func onStageMenuController(_ menuViewController: MenuViewController) {
        menuViewController.view.alpha = 1
        
        menuViewController.textImageView.transform = CGAffineTransform.identity
        menuViewController.textLabel.transform = CGAffineTransform.identity
        
        menuViewController.quoteImageView.transform = CGAffineTransform.identity
        menuViewController.quoteLabel.transform = CGAffineTransform.identity
        
        menuViewController.chatImageView.transform = CGAffineTransform.identity
        menuViewController.chatLabel.transform = CGAffineTransform.identity
        
        menuViewController.photoImageView.transform = CGAffineTransform.identity
        menuViewController.photoLabel.transform = CGAffineTransform.identity
        
        menuViewController.linkImageView.transform = CGAffineTransform.identity
        menuViewController.linkLabel.transform = CGAffineTransform.identity
        
        menuViewController.audioImageView.transform = CGAffineTransform.identity
        menuViewController.audioLabel.transform = CGAffineTransform.identity
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
