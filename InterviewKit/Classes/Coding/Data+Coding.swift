//
//  Data+Coding.swift
//  InterviewKit
//
//  Created by Jeff Cedilla on 12/1/18.
//

import UIKit

public extension Data {
    
    func decode<T: Decodable> (type: T.Type) -> [T] {
        
        let objects = [T]()
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        do {
            return try [decoder.decode(type, from: self)]
        }
        catch {
            print("Error: Could not convert JSON: \(error)")
        }
        
        return objects
    }
    
}
