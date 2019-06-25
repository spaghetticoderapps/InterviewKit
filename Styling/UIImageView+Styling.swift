//
//  UIImageView+Styling.swift
//  InterviewKit
//
//  Created by Jeff Cedilla on 6/23/19.
//

import UIKit

public extension UIImageView {
    
    func addGradient() {
        let view = UIView(frame: self.frame)
        let gradient = CAGradientLayer()
        
        gradient.frame = view.frame
        gradient.colors = [UIColor.clear.cgColor, UIColor.white.cgColor]
        gradient.locations = [0.0, 1.0]
        view.layer.insertSublayer(gradient, at: 0)
        
        self.addSubview(view)
        self.bringSubviewToFront(view)
    }
    
    func setToPlaceholder() {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.7) {
                self.alpha = 0.3
                self.image = UIImage(named: "placeholder")
            }
        }
    }
    
}
