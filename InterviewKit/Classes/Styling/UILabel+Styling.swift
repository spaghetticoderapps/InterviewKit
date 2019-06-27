//
//  UILabel+Styling.swift
//  InterviewKit
//
//  Created by Jeff Cedilla on 6/23/19.
//

import UIKit

public extension UILabel {
    
    func changeLineSpacing(_ lineSpacing: CGFloat, withText text: String) {
        
        let attributedString = NSMutableAttributedString(string: text)
        
        // *** Create instance of `NSMutableParagraphStyle`
        let paragraphStyle = NSMutableParagraphStyle()
        
        // *** set LineSpacing property in points ***
        paragraphStyle.lineSpacing = lineSpacing // Whatever line spacing you want in points
        
        // *** Apply attribute to string ***
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        
        // *** Set Attributed String to your label ***
        self.attributedText = attributedString
        
    }
    
}
