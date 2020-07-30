//
//  GetCrimeByLocationTests.swift
//  PoliceUKNetworking-Tests
//
//  Created by Deniss Kaibagarovs on 27/07/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import XCTest
import Mocker
import Alamofire
import PoliceUKNetworking

class GetCrimeByLocationTests: XCTestCaseBase {
  
  private let requestParamLocationID = "locationID"
  private let requestParamLat = "lat-test"
  private let requestParamLong = "long-test"
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
  func testSuccessByLocationID() {
    let requestExpectation = expectation(description: "Request should finish")
    
    let apiEndpoint = URL(string: PoliceUKEndpoints.crimeByLocation(locationID: requestParamLocationID,
                                                                    date: requestParamDate))!
    let mockedData = try! JSONEncoder().encode(expectedResponse)
    let mock = Mock(url: apiEndpoint, dataType: .json, statusCode: 200, data: [Mock.HTTPMethod.get : mockedData])
    mock.register()
    
    PoliceUKNetworking.getCrimeByLocation(forLocationID: requestParamLocationID,
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
    
    let apiEndpoint = URL(string: PoliceUKEndpoints.crimeByLocation(lat: requestParamLat,
                                                                    lng: requestParamLong,
                                                                    date: requestParamDate))!
    let mockedData = try! JSONEncoder().encode(expectedResponse)
    let mock = Mock(url: apiEndpoint, dataType: .json, statusCode: 200, data: [Mock.HTTPMethod.get : mockedData])
    mock.register()
    
    PoliceUKNetworking.getCrimeByLocation(forLatitude: requestParamLat,
                                          forLongitude: requestParamLong,
                                          forDate: requestParamDate) { (response, error) in
                                            XCTAssertNotNil(response, "response is null on success")
                                            XCTAssertNil(error, "error is not null on success")
                                            XCTAssertEqual(response, self.expectedResponse, "response differ from the expected")
                                            requestExpectation.fulfill()
    }
    
    wait(for: [requestExpectation], timeout: 5.0)
  }
  
  func testErrorByLocationID() {
    let requestExpectation = expectation(description: "Request should finish")
    
    let apiEndpoint = URL(string: PoliceUKEndpoints.crimeByLocation(locationID: requestParamLocationID,
                                                                    date: requestParamDate))!
    let mock = Mock(url: apiEndpoint, dataType: .json, statusCode: 400, data: [Mock.HTTPMethod.get : Data()])
    mock.register()
    
    PoliceUKNetworking.getCrimeByLocation(forLocationID: requestParamLocationID,
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
    
    let apiEndpoint = URL(string: PoliceUKEndpoints.crimeByLocation(lat: requestParamLat,
                                                                    lng: requestParamLong,
                                                                    date: requestParamDate))!
    let mock = Mock(url: apiEndpoint, dataType: .json, statusCode: 400, data: [Mock.HTTPMethod.get : Data()])
    mock.register()
    
    PoliceUKNetworking.getCrimeByLocation(forLatitude: requestParamLat,
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
