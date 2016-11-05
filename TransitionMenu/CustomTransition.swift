//
//  CustomTransition.swift
//  TransitionMenu
//
//  Created by Stanley Pan on 05/11/2016.
//  Copyright © 2016 Stanley Pan. All rights reserved.
//

import UIKit

class CustomTransition: NSObject {
    
    var viewController = UIViewController()
    var duration = 0.5
    var presenting = false
    
    enum CustomTransitionMode: Int {
        case present
        case dimiss
        case pop
    }
    
    var transitionMode: CustomTransitionMode = .present
}

extension CustomTransition: UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let container = transitionContext.containerView
        
    }
}
