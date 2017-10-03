//
//  URL+GPKit.swift
//  GPKit
//
//  Created by Glenn Posadas on 10/3/17.
//  Copyright © 2017 Citus Labs. All rights reserved.
//

import UIKit

public extension URL {
    
    /** Returns the value of a parameter key. Basically extracts a parameter from a URL object.
     */
    
    public func valueOf(_ queryParamaterName: String) -> String? {
        guard let url = URLComponents(string: self.absoluteString) else { return nil }
        return url.queryItems?.first(where: { $0.name == queryParamaterName })?.value
    }
}
