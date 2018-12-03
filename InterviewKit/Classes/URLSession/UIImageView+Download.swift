//
//  UIImageView+Download.swift
//  InterviewKit
//
//  Created by Jeff Cedilla on 12/2/18.
//

import UIKit

public extension UIImageView {
    func download(from url: String) {
        alpha = 0
        guard let url = URL(string: url) else {
            UIView.animate(withDuration: 0.7) {
                self.alpha = 1
                self.image = UIImage(named: "plate")
            }
            return
        }
        DispatchQueue.global().async { [weak self] in
            guard let strongSelf = self else { return }
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
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
