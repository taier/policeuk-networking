//
//  GetStopAndSearchByCustomLocationTests.swift
//  PoliceUKNetworking-Tests
//
//  Created by Deniss Kaibagarovs on 29/07/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import XCTest
import Mocker
import Alamofire
import PoliceUKNetworking

class GetStopAndSearchByCustomLocationTests: XCTestCaseBase {
  
  private let requestParamPoly = ["poly1","poly2"]
  private let requestParamLat = "lat-test"
  private let requestParamLong = "long-test"
  private let requestParamDate = "date-test"
  private let expectedResponse = [PoliceUKStopAndSearchEntity(age_range: "age-range-test",
                                                              self_defined_ethnicity: "self_defined_ethnicity-test",
                                                              outcome_linked_to_object_of_search: false,
                                                              datetime: "datetime-test",
                                                              removal_of_more_than_outer_clothing: false,
                                                              operation: false,
                                                              officer_defined_ethnicity: "officer_defined_ethnicity-test",
                                                              object_of_search: "object_of_search-test",
                                                              involved_person: false,
                                                              gender: "gender-test",
                                                              legislation: "legislation-test",
                                                              location: PoliceUKCrimeLocationEntity(latitude: "latitude-test",
                                                                                              longitude: "longitude-test",
                                                                                              street: nil),
                                                              outcome: "outcome-test",
                                                              type: "type-test",
                                                              operation_name: "operation_name-test")]
  
  func testSuccessByPoly() {
    let requestExpectation = expectation(description: "Request should finish")
    
    let apiEndpoint = URL(string: PoliceUKEndpoints.stopAndSearchByCustomLocation(poly: requestParamPoly,
                                                                                  date: requestParamDate))!
    let mockedData = try! JSONEncoder().encode(expectedResponse)
    let mock = Mock(url: apiEndpoint, dataType: .json, statusCode: 200, data: [Mock.HTTPMethod.get : mockedData])
    mock.register()
    
    PoliceUKNetworking.getStopAndSearchByCustomLocation(forPoly: requestParamPoly,
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
    
    let apiEndpoint = URL(string: PoliceUKEndpoints.stopAndSearchByCustomLocation(lat: requestParamLat,
                                                                                  lng: requestParamLong,
                                                                                  date: requestParamDate))!
    let mockedData = try! JSONEncoder().encode(expectedResponse)
    let mock = Mock(url: apiEndpoint, dataType: .json, statusCode: 200, data: [Mock.HTTPMethod.get : mockedData])
    mock.register()
    
    PoliceUKNetworking.getStopAndSearchByCustomLocation(forLatitude: requestParamLat,
                                                        forLongitude: requestParamLong,
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
    
    let apiEndpoint = URL(string: PoliceUKEndpoints.stopAndSearchByCustomLocation(poly: requestParamPoly,
                                                                                  date: requestParamDate))!
    
    let mock = Mock(url: apiEndpoint, dataType: .json, statusCode: 400, data: [Mock.HTTPMethod.get : Data()])
    mock.register()
    
    PoliceUKNetworking.getStopAndSearchByCustomLocation(forPoly: requestParamPoly,
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
    
    let apiEndpoint = URL(string: PoliceUKEndpoints.stopAndSearchByCustomLocation(lat: requestParamLat,
                                                                                  lng: requestParamLong,
                                                                                  date: requestParamDate))!
    
    let mock = Mock(url: apiEndpoint, dataType: .json, statusCode: 400, data: [Mock.HTTPMethod.get : Data()])
    mock.register()
    
    PoliceUKNetworking.getStopAndSearchByCustomLocation(forLatitude: requestParamLat,
                                                        forLongitude: requestParamLong,
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

