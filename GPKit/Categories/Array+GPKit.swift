//
//  Array+GPKit.swift
//  GPKit
//
//  Created by Glenn Posadas on 5/29/17.
//  Copyright © 2017 Citus Labs. All rights reserved.
//

import UIKit

public extension Array where Element: Equatable {
    public mutating func prependUniqueObj(object: Iterator.Element) {
        if contains(object) == false {
            insert(object, at: 0)
        }
    }
}
