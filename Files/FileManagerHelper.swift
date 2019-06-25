//
//  FileManagerHelper.swift
//  InterviewKit
//
//  Created by Jeff Cedilla on 6/23/19.
//

import Foundation

public class FileManagerHelper {
    
    public init() {}
    
    public func downloadFile(url: URL?, completion: @escaping (String?)->()) {
        let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        if let url = url {
            URLSession.shared.downloadTask(with: url) { temporaryFileLocationURL, response, error in
                guard let temporaryFileLocationURL = temporaryFileLocationURL else {
                    print("download error:", error ?? "")
                    return
                }
                // move the downloaded file from the temporary location url to your app documents directory
                do {
                    let fileName = response?.suggestedFilename ?? url.lastPathComponent
                    let fileURL = documents.appendingPathComponent(fileName)
                    try FileManager.default.moveItem(at: temporaryFileLocationURL, to: fileURL)
//                    completion(fileName)
                } catch {
                    print(error)
                    completion(nil)
                }
                }.resume()
        }
    }
    
    public static func isFileInSystem(fileName: String) -> Bool {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let url = NSURL(fileURLWithPath: path)
        if let pathComponent = url.appendingPathComponent(fileName) {
            let filePath = pathComponent.path
            let fileManager = FileManager.default
            return fileManager.fileExists(atPath: filePath)
        } else {
            return false
        }
    }
    
}
