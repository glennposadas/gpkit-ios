//
//  GPKit+Notification.swift
//  GPKit
//
//  Created by Glenn Posadas on 5/10/17.
//  Copyright © 2017 Citus Labs. All rights reserved.
//

import UIKit

extension Notification.Name {
    static let shouldPresentAuth = Notification.Name("shouldPresentAuth")
    static let shouldPresentHome = Notification.Name("shouldPresentHome")
    static let presentLogout = Notification.Name("presentLogout")
    
    static let shouldSaveCapturedPhoto = Notification.Name("shouldSaveCapturedPhoto")
}
