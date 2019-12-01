//
//  String+Localized.swift
//  InterviewKit
//
//  Created by Jeff Cedilla on 12/1/19.
//

import Foundation

public extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
