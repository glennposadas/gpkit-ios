//
//  Bundle+GPKit.swift
//  GPKit
//
//  Created by Glenn Posadas on 7/31/17.
//  Copyright © 2017 Citus Labs. All rights reserved.
//

import UIKit

public extension Bundle {
    public var versionAndBuildNumber: String {
        return "v\(Bundle.main.versionNumber) b\(Bundle.main.buildNumber)"
    }
    
    private var versionNumber: String {
        return infoDictionary?["CFBundleShortVersionString"] as! String
    }
    
    private var buildNumber: String {
        return infoDictionary?["CFBundleVersion"] as! String
    }
}
