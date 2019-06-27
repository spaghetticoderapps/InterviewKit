//
//  URL+Download.swift
//  InterviewKit
//
//  Created by Jeff Cedilla on 6/23/19.
//

import Foundation

public extension Optional where Wrapped == URL {
    
    func download() {
        let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        if let self = self {
            URLSession.shared.downloadTask(with: self) { locationURL, response, error in
                guard let locationURL = locationURL else {
                    print("download error:", error ?? "")
                    return
                }
                do {
                    try FileManager.default.moveItem(at: locationURL, to: documents.appendingPathComponent(response?.suggestedFilename ?? self.lastPathComponent))
                    
                    // determine whether or not the filemanager
                    
                    // store file path in core data storedmission object,
                    
                } catch {
                    print(error)
                }
                }.resume()
        }
    }
    
}
