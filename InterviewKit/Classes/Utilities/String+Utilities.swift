//
//  String+Utilities.swift
//  InterviewKit
//
//  Created by Jeff Cedilla on 6/28/19.
//

import UIKit

public extension String {
    
    mutating func removeParameter() {
        self = self.replacingOccurrences(of: "\\{([^}]+)\\}", with: "", options: .regularExpression)
    }
    
}
