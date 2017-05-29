//
//  GPKit+Array.swift
//  GPKit
//
//  Created by Glenn Posadas on 5/29/17.
//  Copyright © 2017 Citus Labs. All rights reserved.
//

import UIKit

extension Array where Element: Equatable {
    mutating func prependUniqueObj(object: Iterator.Element) {
        if contains(object) == false {
            insert(object, at: 0)
        }
    }
}
