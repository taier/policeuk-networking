//
//  GetCrimesWithNoLocationTests.swift
//  PoliceUKNetworking-Tests
//
//  Created by Deniss Kaibagarovs on 27/07/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import XCTest
import Mocker
import Alamofire
import PoliceUKNetworking

class GetCrimesWithNoLocationTests: XCTestCaseBase {
  
  private static let requestParamForce = "force-test"
  private static let requestParamCrimeCategory = "category-test"
  private static let requestParamDate = "date-test"
  private let expectedResponse = [PoliceUKCrimeEntitiy(category: "category-test",
                                                      location_type: "location-type-test",
                                                      context: "contex-text",
                                                      persistent_id: "persistent-id-test",
                                                      id: 123,
                                                      location_subtype: "location-subtype-test",
                                                      month: "month-test",
                                                      outcome_status: PoliceUKCrimeOutcomeStatusEntity(category: "category-test",
                                                                                                 date: "date-test"))]
  private let apiEndpoint = URL(string: PoliceUKEndpoints.crimesWithNoLocation(crimeCategory: requestParamForce,
                                                                               force: requestParamCrimeCategory,
                                                                               date: requestParamDate))!
  
  func testSuccess() {
    let requestExpectation = expectation(description: "Request should finish")
    
    let mockedData = try! JSONEncoder().encode(expectedResponse)
    let mock = Mock(url: apiEndpoint, dataType: .json, statusCode: 200, data: [Mock.HTTPMethod.get : mockedData])
    mock.register()
    
    PoliceUKNetworking.getCrimesWithNoLocation(forCrimeCategory: GetCrimesWithNoLocationTests.requestParamForce,
                                               forForce: GetCrimesWithNoLocationTests.requestParamCrimeCategory,
                                               forDate: GetCrimesWithNoLocationTests.requestParamDate) { (response, error) in
                                                XCTAssertNotNil(response, "response is null on success")
                                                XCTAssertNil(error, "error is not null on success")
                                                XCTAssertEqual(response, self.expectedResponse, "response differ from the expected")
                                                requestExpectation.fulfill()
    }
    
    wait(for: [requestExpectation], timeout: 5.0)
  }
  
  func testError() {
    let requestExpectation = expectation(description: "Request should finish")
    
    let mock = Mock(url: apiEndpoint, dataType: .json, statusCode: 400, data: [Mock.HTTPMethod.get : Data()])
    mock.register()
    
    PoliceUKNetworking.getCrimesWithNoLocation(forCrimeCategory: GetCrimesWithNoLocationTests.requestParamForce,
                                               forForce: GetCrimesWithNoLocationTests.requestParamCrimeCategory,
                                               forDate: GetCrimesWithNoLocationTests.requestParamDate) { (response, error) in
                                                XCTAssertNil(response, "response is not null on error")
                                                XCTAssertNotNil(error, "error is null on error")
                                                
                                                switch (error as? AFError) {
                                                case .some(.responseSerializationFailed(reason: .inputDataNilOrZeroLength)):
                                                  break; // correct Error
                                                default:
                                                  XCTFail("Wrong error")
                                                }
                                                requestExpectation.fulfill()
    }
    
    wait(for: [requestExpectation], timeout: 5.0)
  }
}
