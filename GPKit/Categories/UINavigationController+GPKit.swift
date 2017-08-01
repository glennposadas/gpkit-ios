//
//  UINavigationController+GPKit.swift
//  GPKit
//
//  Created by Glenn Posadas on 5/10/17.
//  Copyright © 2017 Citus Labs. All rights reserved.
//

import Foundation
import UIKit

public extension UINavigationController {
    
    /// Used for finding a specific view under the navigationBar
    
    public func getView(withTag tag: Int) -> UIView? {
        let navigationBar = self.navigationBar
        
        for subView in navigationBar.subviews {
            print("TAG: \(subView.tag)")
            if subView.tag ==  tag {
                return subView
            }
        }
        
        return nil
    }
    
    public func showSubtitle(title: String) {
        self.navigationBar.topItem?.prompt = title
    }
    
    public func removeSubtitle() {
        self.navigationBar.topItem?.prompt = nil
    }
}
