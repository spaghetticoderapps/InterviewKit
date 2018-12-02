//
//  String+URLSession.swift
//  InterviewKit
//
//  Created by Jeff Cedilla on 12/1/18.
//

import UIKit

public extension String {
    
    public func get(completion: @escaping (Data?)->()) {
        
        guard let url = URL(string: self) else {
            print("Error: Could not convert string to URL.")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if error != nil { return }
            
            guard let resp = response as? HTTPURLResponse else { return }
            
            // Check that request is good
            if resp.statusCode == 200 {
                
                guard let data = data else {
                    print("Error: Could not get data")
                    return
                }
                completion(data)
            }
            else {
                print("Error: Could not access endpoint. Response code: \(resp.statusCode)")
                return
            }
            
        }
        task.resume()
    }
    
}
