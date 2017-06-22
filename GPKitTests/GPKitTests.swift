//
//  GPKitTests.swift
//  GPKitTests
//
//  Created by Glenn Posadas on 5/6/17.
//  Copyright © 2017 Citus Labs. All rights reserved.
//

import XCTest
@testable import GPKit

class GPKitTests: XCTestCase {
    
    override func setUp() {
        super.setUp()

    }
    
    func testCountryForCountryObjects() {
        let nilCountry = Country(name: "nil", countryCode: "nil", dialCode: "nil")
        let countries = GPCountry.getCountryObjects()
        XCTAssertFalse(countries.count == 0)
    }
}
