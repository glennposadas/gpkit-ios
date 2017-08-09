//
//  GPLog.swift
//  GPKit
//
//  Created by Glenn Posadas on 5/10/17.
//  Copyright © 2017 Citus Labs. All rights reserved.
//

import UIKit

/** Public function to use for logging.
 *  Merely an extension of Apple's print.
 */

public func GPLog(classSender: Any, log: String?) {
    print("GPKit🐞🐞🐞 -- \(typeName(classSender)) \(Date()): -- \(log ?? "Nil")")
}

private func typeName(_ some: Any) -> String {
    return (some is Any.Type) ? "\(some)" : "\(type(of: some))"
}
