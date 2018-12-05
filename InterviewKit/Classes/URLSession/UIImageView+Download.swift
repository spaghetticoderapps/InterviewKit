//
//  UIImageView+Download.swift
//  InterviewKit
//
//  Created by Jeff Cedilla on 12/2/18.
//

import UIKit

class IKImageCache {
    static let shared = IKImageCache()
    
    let cache = NSCache<AnyObject, AnyObject>()
}

public extension UIImageView {
    func download(from url: String) {
        alpha = 0
        image = nil
        
        guard let url = URL(string: url) else {
            UIView.animate(withDuration: 0.7) {
                self.alpha = 1
                self.image = UIImage(named: "plate")
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
