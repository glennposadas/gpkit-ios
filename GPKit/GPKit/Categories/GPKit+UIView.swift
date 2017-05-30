//
//  GPKit+UIView.swift
//  GPKit
//
//  Created by Glenn Posadas on 5/10/17.
//  Copyright © 2017 Citus Labs. All rights reserved.
//

import Foundation
import UIKit

public enum RadiusSize: CGFloat {
    case smallAmount = 30.0
    case mediumAmount = 40.0
    case largeAmount = 50.0
    case slideShowCornerAmount = 10.0 // amuount of edge.
    case edgeAmount = 3.0 // amount for the view's edge only.
}

public extension UIView {
    
    public func makeRoundCornerLeft(radiusSize: RadiusSize) -> UIView {
        
        let path = UIBezierPath(roundedRect:self.bounds,
                                byRoundingCorners:[.topLeft, .bottomLeft],
                                cornerRadii: CGSize(width: radiusSize.rawValue, height:  radiusSize.rawValue))
        
        let maskLayer = CAShapeLayer()
        
        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer
        
        return self
    }
    
    public func makeRoundCorners() -> UIView {
        self.layer.cornerRadius = self.frame.size.height / 2
        self.layer.masksToBounds = true
        self.clipsToBounds = true
        self.layer.borderWidth = 0
        
        return self
    }
    
    public func addCornerRadius(radiusSize: RadiusSize) -> UIView {
        self.layer.cornerRadius = radiusSize.rawValue
        self.layer.masksToBounds = true
        self.clipsToBounds = true
        
        return self
    }
    
    public func addCornerRadius(
        cornerRadius: CGFloat,
        borderColor: UIColor,
        borderWidth: CGFloat) -> UIView {
        
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
        self.clipsToBounds = true
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        
        return self
    }
    
    public func addShadowToSeparatorView() {
        let shadowPath = UIBezierPath(rect: self.bounds)
        
        self.layer.masksToBounds = false
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowOpacity = 0.3
        self.layer.shadowPath = shadowPath.cgPath
    }
    
    public func addDefaultShadow() {
        let shadowPath = UIBezierPath(rect: self.bounds)
        
        self.layer.masksToBounds = false
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.shadowOpacity = 0.5
        self.layer.shadowPath = shadowPath.cgPath
    }
    
    public func addShadowBottomRight() {
        self.layer.masksToBounds = false
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 2.0
    }
    
    public func addShadowToCell() {
        self.layer.shadowOpacity = 0.7
        self.layer.shadowRadius = 1.0
        self.layer.shadowOffset = CGSize(width: 0, height: 0);
        self.layer.shadowColor = UIColor.black.cgColor
    }
        
    public func shake() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.duration = 0.6
        animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        layer.add(animation, forKey: "shake")
    }
    
}
