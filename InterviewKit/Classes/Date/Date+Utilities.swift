//
//  Date+Utilities.swift
//  InterviewKit
//
//  Created by Jeff Cedilla on 6/22/19.
//

import Foundation

public extension Date {
    
    func localDateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d, yyyy 'at' h:mma"
        dateFormatter.timeZone = NSTimeZone.local
        return dateFormatter.string(from: self)
        
    }
    
}
