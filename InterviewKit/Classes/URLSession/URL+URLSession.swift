//
//  URL+URLSession.swift
//  InterviewKit
//
//  Created by Jeff Cedilla on 6/28/19.
//

import Foundation

public extension URL {
    
    func get(completion: @escaping (Data?)->()) {
        var request = URLRequest(url: self)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { (dataResponse, response, error) in
            
            if error != nil { return }
            
            guard let resp = response as? HTTPURLResponse else { return }
            
            // Check that request is good
            if resp.statusCode == 200 {
                
                guard let data = dataResponse else {
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
