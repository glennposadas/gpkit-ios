//
//  GPKit+UIButton.swift
//  GPKit
//
//  Created by Glenn Posadas on 6/21/17.
//  Copyright © 2017 Citus Labs. All rights reserved.
//

import UIKit

public extension UIButton {
    
    /** Adjusts the leadingAnchor constraint of the imageView of a button.
     *  @params xPositionFromLeading - the X position of the imageView from the leading edge.
     */
    
    public func adjustImageFromLeading(xPositionFromLeading: CGFloat) {
        self.imageView?.translatesAutoresizingMaskIntoConstraints = false
        self.imageView?.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: xPositionFromLeading).isActive = true
        self.imageView?.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
    }
    
    /** Adjusts the center constraint of the imageView of a button.
     *  @params xPositionFromCenter - the X position of the imageView from the center of the button.
     */
    
    public func adjustImageFromCenter(xPositionFromCenter: CGFloat) {
        self.imageView?.translatesAutoresizingMaskIntoConstraints = false
        self.imageView?.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: xPositionFromCenter).isActive = true
        self.imageView?.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
    }
    
    /** Function used to indicate loading process by adding an acitivity indicator to a button.
     *  NOTE: Should revert the button's normal state upon removing the loading state
     */
    
    public func setProcessing(_ processing: Bool, color: UIColor? = .gray) {
        
        self.isEnabled = !processing
        self.setTitle("", for: .normal)
        
        if processing {
            
            // Loop through self's subviews.
            // Start if it has a subView already.
            
            let subviews = self.subviews
            for subview in subviews {
                if subview is UIActivityIndicatorView {
                    if let activityIndicator = subview as? UIActivityIndicatorView {
                        activityIndicator.color = color
                        activityIndicator.isHidden = false
                        activityIndicator.startAnimating()
                        return
                    }
                }
            }
            
            // If there's no activity indicator yet, add it.
            
            let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
            activityIndicator.color = color
            activityIndicator.startAnimating()
            activityIndicator.translatesAutoresizingMaskIntoConstraints = false
            
            self.addSubview(activityIndicator)
            
            // Add constraints
            
            activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
            activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
            
        } else {
            // Loop through self's subviews.
            // And then stop it
            
            let subviews = self.subviews
            for subview in subviews {
                if subview is UIActivityIndicatorView {
                    if let activityIndicator = subview as? UIActivityIndicatorView {
                        activityIndicator.stopAnimating()
                        activityIndicator.isHidden = true
                        return
                    }
                }
            }
        }
    }
    
}
