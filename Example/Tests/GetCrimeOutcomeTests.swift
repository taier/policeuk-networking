//
//  GetCrimeOutcomeTests.swift
//  PoliceUKNetworking-Tests
//
//  Created by Deniss Kaibagarovs on 26/07/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import XCTest
import Mocker
import Alamofire
import PoliceUKNetworking

class GetCrimeOutcomeTests: XCTestCaseBase {
  
  private static let requestParam = "crimeid-test"
  private let expectedResponse = PoliceUKCrimeOutcomeRootEntity(outcomes: [PoliceUKCrimeOutcomeEntity(date: "2020-10",
                                                                                            person_id: "personid-test")],
                                                            crime: PoliceUKCrimeEntitiy(category: "category-test",
                                                                                        location_type: "location-type-test",
                                                                                        context: "context-text",
                                                                                        persistent_id: "persistentid-test",
                                                                                        id: 123,
                                                                                        location_subtype: "location-subtype-tesst",
                                                                                        month: "2020-10",
                                                                                        location: PoliceUKCrimeLocationEntity(latitude: "latitude-test",
                                                                                                                        longitude: "longitude-test",
                                                                                                                        street: PoliceUKCrimeLocationStreetEntity(id: 111,
                                                                                                                                                            name: "name-test"))))
  private let apiEndpoint = URL(string: PoliceUKEndpoints.crimeOutcome(crime: requestParam))!
  
  func testSuccess() {
    let requestExpectation = expectation(description: "Request should finish")
    
    let mockedData = try! JSONEncoder().encode(expectedResponse)
    let mock = Mock(url: apiEndpoint, dataType: .json, statusCode: 200, data: [Mock.HTTPMethod.get : mockedData])
    mock.register()
    
    PoliceUKNetworking.getCrimeOutcome(forCrime: GetCrimeOutcomeTests.requestParam) { (response, error) in
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
    
    PoliceUKNetworking.getCrimeOutcome(forCrime: GetCrimeOutcomeTests.requestParam) { (response, error) in
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
