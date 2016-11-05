//
//  MenuTransitionManager.swift
//  TransitionMenu
//
//  Created by Stanley Pan on 05/11/2016.
//  Copyright © 2016 Stanley Pan. All rights reserved.
//

import UIKit

class MenuTransitionManager: UIPercentDrivenInteractiveTransition, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
    
    fileprivate var presenting = false
    fileprivate var interactive = false
    fileprivate var enterPanGesture: UIScreenEdgePanGestureRecognizer!
    
    var sourceViewController: UIViewController! {
        didSet {
            self.enterPanGesture = UIScreenEdgePanGestureRecognizer()
            self.enterPanGesture.addTarget(self, action: #selector(handleOnStagePan))
            self.enterPanGesture.edges = UIRectEdge.left
            self.sourceViewController.view.addGestureRecognizer(self.enterPanGesture)
        }
    }
    
    func handleOnStagePan(pan: UIPanGestureRecognizer) {
        // TODO: We will take care of this later
        print("We triggered a pan gesture")
        
        let translation = pan.translation(in: pan.view)
        let translationDistance = translation.x / pan.view!.bounds.width * 0.5
        
        switch (pan.state) {
        case UIGestureRecognizerState.began:
            self.interactive = true
            // TODO: transition to menu
            let menuViewController = MenuViewController()
            menuViewController.transitioningDelegate = self
            menuViewController.modalPresentationStyle = .overFullScreen
            self.sourceViewController.present(menuViewController, animated: true, completion: nil)
            break
            
        case UIGestureRecognizerState.changed:
            self.update(translationDistance)
            break
            
        default:
            self.interactive = false
            self.finish()
        }
    }
    
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
    
    func offStage(_ amount: CGFloat) -> CGAffineTransform {
        return CGAffineTransform(translationX: amount, y: 0)
    }
    
    func offStageMenuController(_ menuViewController: MenuViewController) {
        menuViewController.view.alpha = 0
        
        // Stagger values for items
        let topRowOffset: CGFloat = 300
        let middleRowOffset: CGFloat = 150
        let bottomRowOffset: CGFloat = 50
        
        menuViewController.textImageView.transform = offStage(-topRowOffset)
        menuViewController.textLabel.transform = offStage(-topRowOffset)
        
        menuViewController.quoteImageView.transform = offStage(-middleRowOffset)
        menuViewController.quoteLabel.transform = offStage(-middleRowOffset)
        
        menuViewController.chatImageView.transform = offStage(-bottomRowOffset)
        menuViewController.chatLabel.transform = offStage(-bottomRowOffset)
        
        menuViewController.photoImageView.transform = offStage(topRowOffset)
        menuViewController.photoLabel.transform = offStage(topRowOffset)
        
        menuViewController.linkImageView.transform = offStage(middleRowOffset)
        menuViewController.linkLabel.transform = offStage(middleRowOffset)
        
        menuViewController.audioImageView.transform = offStage(bottomRowOffset)
        menuViewController.audioLabel.transform = offStage(bottomRowOffset)
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
    
    func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return self.interactive ? self : nil
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return self.interactive ? self : nil
    }
}

















