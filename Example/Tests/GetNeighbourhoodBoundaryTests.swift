//
//  GetNeighbourhoodBoundaryTests.swift
//  PoliceUKNetworking-Tests
//
//  Created by Deniss Kaibagarovs on 28/07/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import XCTest
import Mocker
import Alamofire
import PoliceUKNetworking

class GetNeighbourhoodBoundaryTests: XCTestCaseBase {
  
  private static let requestForce = "force-test"
  private static let requestNeighbourhood = "neighbourhood-test"
  private let expectedResponse = [PoliceUKNeighbourhoodBoundaryEntity(latitude: "latitude-test", longitude: "longitude-test")]
  private let apiEndpoint = URL(string: PoliceUKEndpoints.neighbourhoodBoundary(force: requestForce, neighbourhood: requestNeighbourhood))!
  
  func testSuccess() {
    let requestExpectation = expectation(description: "Request should finish")
    
    let mockedData = try! JSONEncoder().encode(expectedResponse)
    let mock = Mock(url: apiEndpoint, dataType: .json, statusCode: 200, data: [Mock.HTTPMethod.get : mockedData])
    mock.register()
    
    PoliceUKNetworking.getNeighbourhoodBoundary(forForce: GetNeighbourhoodBoundaryTests.requestForce,
                                                forNeighbourhood: GetNeighbourhoodBoundaryTests.requestNeighbourhood)
    { (response, error) in
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
    
    PoliceUKNetworking.getNeighbourhoodBoundary(forForce: GetNeighbourhoodBoundaryTests.requestForce,
                                                forNeighbourhood: GetNeighbourhoodBoundaryTests.requestNeighbourhood)
    { (response, error) in
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
