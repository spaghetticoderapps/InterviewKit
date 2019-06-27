//
//  UIView+Constraints.swift
//  InterviewKit
//
//  Created by Jeff Cedilla on 11/30/18.
//

import UIKit

extension UIView {
    
    public func constrainToSuperviewBorders() {
        constrainToBorders(ofView: superview!)
    }
    
    public func constrainToBorders(ofView view: UIView, onView topView: UIView? = nil) {
        translatesAutoresizingMaskIntoConstraints = false
        var topView = topView
        if topView == nil {
            topView = view
            if let superSuperview = topView!.superview, !(superSuperview is UITableViewCell) {
                topView = superSuperview
            }
        }
        topView!.addConstraints([
            NSLayoutConstraint(item: self, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: self, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0),
            ])
    }
    
    public func constrainToSuperviewMiddle() {
        translatesAutoresizingMaskIntoConstraints = false
        var topView = superview!
        if let superSuperview = topView.superview, !(superSuperview is UITableViewCell) {
            topView = superSuperview
        }
        topView.addConstraints([
            NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: superview, attribute: .centerX, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: superview, attribute: .centerY, multiplier: 1, constant: 0)
            ])
    }
    
    public func centerView() {
        center = superview?.center ?? center
    }
    
    public func fillSuperview() {
        frame = superview?.bounds ?? frame
    }
    
    func leadingAnchor(bindingView: UIView, constant: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: bindingView.leadingAnchor, constant: constant).isActive = true
    }
    
    func trailingAnchor(bindingView: UIView, constant: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.trailingAnchor.constraint(equalTo: bindingView.trailingAnchor, constant: constant).isActive = true
    }
    
    func topAnchor(bindingConstraint: NSLayoutYAxisAnchor, constant: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: bindingConstraint, constant: constant).isActive = true
    }
    
    func bottomAnchor(bindingConstraint: NSLayoutYAxisAnchor, constant: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.bottomAnchor.constraint(equalTo: bindingConstraint, constant: constant).isActive = true
    }
    
    func centerX(bindingView: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerXAnchor.constraint(equalTo: bindingView.centerXAnchor).isActive = true
    }
    
    func centerY(bindingView: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerYAnchor.constraint(equalTo: bindingView.centerYAnchor).isActive = true
    }
    
    func heightAnchor(constant: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: constant).isActive = true
    }
    
    func widthAnchor(constant: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: constant).isActive = true
    }
    
    func heightAnchorProportional(bindingView: UIView, multiplier: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalTo: bindingView.heightAnchor, multiplier: multiplier).isActive = true
    }
    
    func widthAnchorProportional(bindingView: UIView, multiplier: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalTo: bindingView.widthAnchor, multiplier: multiplier).isActive = true
    }
    
    func addConstraintsWithFormat(format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary["v\(index)"] = view
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }
    
    
}
