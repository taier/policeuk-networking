//
//  GetForcesListTests.swift
//  PoliceUKNetworking-Tests
//
//  Created by Deniss Kaibagarovs on 26/07/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import XCTest
import Mocker
import Alamofire
import PoliceUKNetworking

class GetNeighbourhoodDetailsTests: XCTestCaseBase {
  
  private static let requestParamForce = "force-test"
  private static let requestParamNeibourhood = "neibourhood-test"
  private let expectedResponse = PoliceUKNeighbourhoodDetailsEntity(url_force: "url-force-test",
                                                                    name: "name-test",
                                                                    description: "descriptiom-test",
                                                                    id: "id-test",
                                                                    population: "population-test",
                                                                    welcome_message: "welcome_message-test",
                                                                    contact_details: PoliceUKNeighbourhoodContactDetailsEntity(twitter:"twitter-test"),
                                                                    links: [PoliceUKNeighbourhoodLinkEntity(url: "url-test",
                                                                                                      description: "description-test",
                                                                                                      title: "title-test")],
                                                                    centre: PoliceUKNeighbourhoodCentreEntity(latitude: "latitude-test"),
                                                                    locations: [PoliceUKNeighbourhoodLocationEntity(name:"name-test")])
  private let apiEndpoint = URL(string: PoliceUKEndpoints.neighbourhoodDetails(force: requestParamForce,
                                                                               neighbourhood: requestParamNeibourhood))!
  
  func testSuccess() {
    let requestExpectation = expectation(description: "Request should finish")
    
    let mockedData = try! JSONEncoder().encode(expectedResponse)
    let mock = Mock(url: apiEndpoint, dataType: .json, statusCode: 200, data: [Mock.HTTPMethod.get : mockedData])
    mock.register()
    
    PoliceUKNetworking.getNeighbourhoodDetails(forForce: GetNeighbourhoodDetailsTests.requestParamForce,
                                            forNeighbourhood: GetNeighbourhoodDetailsTests.requestParamNeibourhood
    ) { (response, error) in
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
    
    PoliceUKNetworking.getNeighbourhoodDetails(forForce: GetNeighbourhoodDetailsTests.requestParamForce,
                                            forNeighbourhood: GetNeighbourhoodDetailsTests.requestParamNeibourhood
    ) { (response, error) in
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
