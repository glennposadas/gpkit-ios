//
//  GPKit+Error.swift
//  TimeIn
//
//  Created by Glenn Posadas on 5/25/17.
//  Copyright © 2017 Glenn Posadas. All rights reserved.
//

import Foundation
import UIKit

public class GPKitError {
    public static func newError(description: String, code: Int = -1) -> Error {
        let customError = NSError(
            domain: "GPKit",
            code: code,
            userInfo: [NSLocalizedDescriptionKey : description]
        )
        
        return customError
    }
}
