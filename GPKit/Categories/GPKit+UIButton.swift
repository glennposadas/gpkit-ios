//
//  GPKit+UIButton.swift
//  GPKit
//
//  Created by Glenn Posadas on 6/21/17.
//  Copyright © 2017 Citus Labs. All rights reserved.
//

import Foundation

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
}
