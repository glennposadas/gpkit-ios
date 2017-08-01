//
//  Notification+GPKit.swift
//  GPKit
//
//  Created by Glenn Posadas on 5/10/17.
//  Copyright © 2017 Citus Labs. All rights reserved.
//

import Foundation
import UIKit

public extension Notification.Name {
    public static let shouldPresentAuth = Notification.Name("shouldPresentAuth")
    public static let shouldPresentHome = Notification.Name("shouldPresentHome")
}
