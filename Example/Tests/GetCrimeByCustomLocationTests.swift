//
//  GetCrimeByCustomLocationTests.swift
//  PoliceUKNetworking-Tests
//
//  Created by Deniss Kaibagarovs on 28/07/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import XCTest
import Mocker
import Alamofire
import PoliceUKNetworking

class GetCrimeByCustomLocationTests: XCTestCaseBase {
  
  private let requestParamPoly = ["poly1","poly2"]
  private let requestParamLat = "lat-test"
  private let requestParamLong = "long-test"
  private let requestParamCrimeCategory = "crime-category-test"
  private let requestParamDate = "date-test"
  private let expectedResponse = [PoliceUKCrimeEntitiy(category: "category-test",
                                                       location_type: "location-type-test",
                                                       context: "contex-text",
                                                       persistent_id: "persistent-id-test",
                                                       id: 123,
                                                       location_subtype: "location-subtype-test",
                                                       month: "month-test",
                                                       outcome_status: PoliceUKCrimeOutcomeStatusEntity(category: "category-test",
                                                                                                  date: "date-test"))]
  func testSuccessByPoly() {
    let requestExpectation = expectation(description: "Request should finish")
    
    let apiEndpoint = URL(string: PoliceUKEndpoints.crimeByCustomLocation(poly: requestParamPoly,
                                                                          crimeCategory: requestParamCrimeCategory,
                                                                          date: requestParamDate))!
    let mockedData = try! JSONEncoder().encode(expectedResponse)
    let mock = Mock(url: apiEndpoint, dataType: .json, statusCode: 200, data: [Mock.HTTPMethod.get : mockedData])
    mock.register()
    
    PoliceUKNetworking.getCrimesByCustomLocation(forPoly: requestParamPoly,
                                                forCrimeCategory: requestParamCrimeCategory,
                                                forDate: requestParamDate) { (response, error) in
                                                  XCTAssertNotNil(response, "response is null on success")
                                                  XCTAssertNil(error, "error is not null on success")
                                                  XCTAssertEqual(response, self.expectedResponse, "response differ from the expected")
                                                  requestExpectation.fulfill()
    }
    
    wait(for: [requestExpectation], timeout: 5.0)
  }
  
  func testSuccessByLatitudeLongitude() {
    let requestExpectation = expectation(description: "Request should finish")
    
    let apiEndpoint = URL(string: PoliceUKEndpoints.crimeByCustomLocation(lat: requestParamLat,
                                                                          lng: requestParamLong,
                                                                          crimeCategory: requestParamCrimeCategory,
                                                                          date: requestParamDate))!
    let mockedData = try! JSONEncoder().encode(expectedResponse)
    let mock = Mock(url: apiEndpoint, dataType: .json, statusCode: 200, data: [Mock.HTTPMethod.get : mockedData])
    mock.register()
    
    PoliceUKNetworking.getCrimesByCustomLocation(forLatitude: requestParamLat,
                                                forLongitude: requestParamLong,
                                                forCrimeCategory: requestParamCrimeCategory,
                                                forDate: requestParamDate) { (response, error) in
                                                  XCTAssertNotNil(response, "response is null on success")
                                                  XCTAssertNil(error, "error is not null on success")
                                                  XCTAssertEqual(response, self.expectedResponse, "response differ from the expected")
                                                  requestExpectation.fulfill()
    }
    
    wait(for: [requestExpectation], timeout: 5.0)
  }
  
  func testErrorByPoly() {
    let requestExpectation = expectation(description: "Request should finish")
    
    let apiEndpoint = URL(string: PoliceUKEndpoints.crimeByCustomLocation(poly: requestParamPoly,
                                                                          crimeCategory: requestParamCrimeCategory,
                                                                          date: requestParamDate))!
    
    let mock = Mock(url: apiEndpoint, dataType: .json, statusCode: 400, data: [Mock.HTTPMethod.get : Data()])
    mock.register()
    
    PoliceUKNetworking.getCrimesByCustomLocation(forPoly: requestParamPoly,
                                                forCrimeCategory: requestParamCrimeCategory,
                                                forDate: requestParamDate) { (response, error) in
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
  
  func testErrorByLatitudeLongitude() {
    let requestExpectation = expectation(description: "Request should finish")
    
    let apiEndpoint = URL(string: PoliceUKEndpoints.crimeByCustomLocation(lat: requestParamLat,
                                                                          lng: requestParamLong,
                                                                          crimeCategory: requestParamCrimeCategory,
                                                                          date: requestParamDate))!
    
    let mock = Mock(url: apiEndpoint, dataType: .json, statusCode: 400, data: [Mock.HTTPMethod.get : Data()])
    mock.register()
    
    PoliceUKNetworking.getCrimesByCustomLocation(forLatitude: requestParamLat,
                                                forLongitude: requestParamLong,
                                                forCrimeCategory: requestParamCrimeCategory,
                                                forDate: requestParamDate) { (response, error) in
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

