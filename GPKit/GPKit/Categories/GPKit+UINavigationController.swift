//
//  GPKit+UINavigationController.swift
//  GPKit
//
//  Created by Glenn Posadas on 5/10/17.
//  Copyright © 2017 Citus Labs. All rights reserved.
//

import UIKit

public extension UINavigationController {
    
    /// Used for finding a specific view under the navigationBar
    
    func getView(withTag tag: Int) -> UIView? {
        let navigationBar = self.navigationBar
        
        for subView in navigationBar.subviews {
            print("TAG: \(subView.tag)")
            if subView.tag ==  tag {
                return subView
            }
        }
        
        return nil
    }
    
    func showSubtitle(title: String) {
        self.navigationBar.topItem?.prompt = title
    }
    
    func removeSubtitle() {
        self.navigationBar.topItem?.prompt = nil
    }
}
