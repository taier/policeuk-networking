//
//  GetSpecificForceTests.swift
//  PoliceUKNetworking-Tests
//
//  Created by Deniss Kaibagarovs on 26/07/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import XCTest
import Mocker
import Alamofire
import PoliceUKNetworking

class GetSpecificForceTests: XCTestCaseBase {
  
  private static let requestParam = "leicestershire"
  private let expectedResponse = PoliceUKSpecificForceEntity(id: "leicestershire",
                                                             name: "Leicestershire Police",
                                                             description: "description-test",
                                                             url: "url-test",
                                                             telephone: "101",
                                                             engagement_methods: [PoliceUKSpecificForceEngagementMethod(url: "url-test",
                                                                                                                        type: "type-test",
                                                                                                                        description: "description-test",
                                                                                                                        title: "title-test")])
  private let apiEndpoint = URL(string: PoliceUKEndpoints.specificForce(force: requestParam))!
  
  func testSuccessWithoutDate() {
    let requestExpectation = expectation(description: "Request should finish")
    
    let mockedData = try! JSONEncoder().encode(expectedResponse)
    let mock = Mock(url: apiEndpoint, dataType: .json, statusCode: 200, data: [Mock.HTTPMethod.get : mockedData])
    mock.register()
    
    PoliceUKNetworking.getSpecificForce(forForce: GetSpecificForceTests.requestParam) { (response, error) in
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
    
    PoliceUKNetworking.getSpecificForce(forForce: GetSpecificForceTests.requestParam) { (response, error) in
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
