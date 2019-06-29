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
    
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
    
}
