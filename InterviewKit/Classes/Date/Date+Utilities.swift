//
//  Date+Utilities.swift
//  InterviewKit
//
//  Created by Jeff Cedilla on 6/22/19.
//

import Foundation

public extension Date {
    
    func localDateString(dateFormat: String = "MMMM d, yyyy 'at' h:mma") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        dateFormatter.timeZone = NSTimeZone.local
        return dateFormatter.string(from: self)
    }
}
