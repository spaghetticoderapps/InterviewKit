//
//  UIImageView+Download.swift
//  InterviewKit
//
//  Created by Jeff Cedilla on 12/2/18.
//

import UIKit
import CoreData

class IKImageCache {
    static let shared = IKImageCache()
    
    let cache = NSCache<AnyObject, AnyObject>()
}

public extension UIImageView {
    
    func setFromFile(fileName: String?) {
        guard let fileName = fileName else {
            setToPlaceholder()
            return
        }
        
        let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let url = documents.appendingPathComponent(fileName)
        
        if !FileManagerHelper.isFileInSystem(fileName: fileName) {
            setToPlaceholder()
            return
        }
        
        DispatchQueue.main.async {
            self.alpha = 0
            self.image = nil
        }
        
        DispatchQueue.global().async { [weak self] in
            guard let strongSelf = self else { return }
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        UIView.animate(withDuration: 0.7) {
                            strongSelf.alpha = 0.3
                            strongSelf.image = image
                        }
                    }
                } else {
                    self?.setToPlaceholder()
                }
            } else {
                // Handle error
                self?.setToPlaceholder()
            }
        }
    }
    
    
    func download(from url: URL?, completion: @escaping (Bool)->()) {
        alpha = 0
        image = nil
        
        guard let url = url else {
            UIView.animate(withDuration: 0.7) {
                self.alpha = 0.3
                self.image = UIImage(named: "placeholder")
            }
            completion(false)
            return
        }
        
        DispatchQueue.global().async { [weak self] in
            guard let strongSelf = self else { return }
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        UIView.animate(withDuration: 0.7) {
                            strongSelf.alpha = 0.3
                            strongSelf.image = image
                            completion(true)
                        }
                    }
                }
            } else {
                // Handle download error
                DispatchQueue.main.async {
                    UIView.animate(withDuration: 0.7) {
                        self?.alpha = 0.3
                        self?.image = UIImage(named: "placeholder")
                        completion(false)
                    }
                }
            }
        }
    }
    
    func download(from url: String) {
        alpha = 0
        image = nil
        
        guard let url = URL(string: url) else {
            UIView.animate(withDuration: 0.7) {
                self.alpha = 1
//                self.image = UIImage
            }
            return
        }
        
        if let cachedImage = IKImageCache.shared.cache.object(forKey: url as AnyObject) as? UIImage {
            UIView.animate(withDuration: 0.7) {
                self.alpha = 1
                self.image = cachedImage
            }
            return
        }
        
        DispatchQueue.global().async { [weak self] in
            guard let strongSelf = self else { return }
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        IKImageCache.shared.cache.setObject(image, forKey: url as AnyObject)
                        
                        UIView.animate(withDuration: 0.7) {
                            strongSelf.alpha = 1
                            strongSelf.image = image
                        }
                    }
                }
            }
        }
    }
}
