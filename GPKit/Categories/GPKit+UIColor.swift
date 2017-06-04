//
//  GPKit+UIColor.swift
//  GPKit
//
//  Created by Glenn Posadas on 5/10/17.
//  Copyright © 2017 Citus Labs. All rights reserved.
//

import Foundation
import UIKit

public struct GPKitFlatColor {
    
    /** Sample color. Extend to add your app's main theme colors.
     */
    
    public static let orange = UIColor.colorWithRGBHex(0xFF4949)
}

public extension UIColor {
    public class func colorWithRGBHex(_ hex: Int, alpha: Float = 1.0) -> UIColor {
        let r = Float((hex >> 16) & 0xFF)
        let g = Float((hex >> 8) & 0xFF)
        let b = Float((hex) & 0xFF)
        
        return UIColor(red: CGFloat(r / 255.0), green: CGFloat(g / 255.0), blue:CGFloat(b / 255.0), alpha: CGFloat(alpha))
    }
}
