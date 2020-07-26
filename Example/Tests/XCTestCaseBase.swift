//
//  XCTestCaseBase.swift
//  PoliceUKNetworking-Tests
//
//  Created by Deniss Kaibagarovs on 26/07/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import PoliceUKNetworking
import Foundation
import Alamofire
import XCTest
import Mocker

class XCTestCaseBase: XCTestCase {
  
  override func setUp() {
    let configuration = URLSessionConfiguration.af.default
    configuration.protocolClasses = [MockingURLProtocol.self] + (configuration.protocolClasses ?? [])
    let sessionManager = Session(configuration: configuration)
    PoliceUKNetworking.setSession(session: sessionManager)
  }
}
