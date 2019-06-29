//
//  String+Date.swift
//  InterviewKit
//
//  Created by Jeff Cedilla on 6/22/19.
//

import Foundation

public extension String {
    
    func date() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.formatterBehavior = .default
        return dateFormatter.date(from: self)!
    }
    
    func localDateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d, yyyy 'at' h:mma"
        dateFormatter.timeZone = NSTimeZone.local
        return dateFormatter.string(from: self.date())
        
    }
    
}
