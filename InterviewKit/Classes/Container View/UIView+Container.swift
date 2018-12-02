//
//  UIView+Container.swift
//  InterviewKit
//
//  Created by Jeff Cedilla on 12/2/18.
//

import UIKit

public extension UIView {
    
    public func test() {
        print("test")
    }
    
    public func swapToViewController(containerViewController: UIViewController, destinationViewController: UIViewController) {
        
        let child = containerViewController.children[0]
        // Remove container view contents
        child.willMove(toParent: nil)
        child.view.removeFromSuperview()
        child.removeFromParent()
        
        // Change container view contents
        containerViewController.addChild(destinationViewController)
        self.addSubview(destinationViewController.view)
        destinationViewController.view.frame = self.bounds
        destinationViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        destinationViewController.view.alpha = 0
        
        
        destinationViewController.didMove(toParent: containerViewController)
    }
    
}
