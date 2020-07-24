//
//  policeuk_networkingTests.swift
//  policeuk-networkingTests
//
//  Created by Deniss Kaibagarovs on 24/07/2020.
//  Copyright © 2020 Deniss Kaibagarovs. All rights reserved.
//

import XCTest
@testable import policeuk_networking

class policeuk_networkingTests: XCTestCase {

    func testExample() throws {
      
      XCTAssert(PoliceUKNetworking.getNumberOfCrimes() == 10, "Wrong number of crimes")
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
