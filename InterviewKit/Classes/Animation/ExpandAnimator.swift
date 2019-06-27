//
//  ExpandAnimator.swift
//  InterviewKit
//
//  Created by Jeff Cedilla on 6/26/19.
//

import UIKit

public class ExpandAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    let duration = 0.8
    var presenting = true
    var originFrame: CGRect
    
    public init(originFrame: CGRect) {
        self.originFrame = originFrame
    }
    
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        let toView = transitionContext.view(forKey: .to)!
        containerView.addSubview(toView)
        toView.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        UIView.animate(
            withDuration: duration,
            animations: {
                toView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        },
            completion: { _ in
                transitionContext.completeTransition(true)
        }
        )
    }
    
    
    
    
    
}

