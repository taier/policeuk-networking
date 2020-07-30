//  Created by Deniss Kaibagarovs d.kaibagarov@gmail.com

import XCTest
import Mocker
import Alamofire
import PoliceUKNetworking

class GetNeighbourhoodByLocationTests: XCTestCaseBase {
  
  private static let requestParamLat = "lat-test"
  private static let requestParamLong = "long-test"
  private let expectedResponse = PoliceUKLocateNeighbourhoodEntity(force: "force-test", neighbourhood: "neighbourhoo")
  private let apiEndpoint = URL(string: PoliceUKEndpoints.locateNeighbourhood(lat: requestParamLat, lng: requestParamLong))!
  
  func testSuccess() {
    let requestExpectation = expectation(description: "Request should finish")
    
    let mockedData = try! JSONEncoder().encode(expectedResponse)
    let mock = Mock(url: apiEndpoint, dataType: .json, statusCode: 200, data: [Mock.HTTPMethod.get : mockedData])
    mock.register()
    
    PoliceUKNetworking.getNeighbourhoodByLocation(forLatitude: GetNeighbourhoodByLocationTests.requestParamLat,
                                                  forLongitude: GetNeighbourhoodByLocationTests.requestParamLong)
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
    
    PoliceUKNetworking.getNeighbourhoodByLocation(forLatitude: GetNeighbourhoodByLocationTests.requestParamLat,
                                                  forLongitude: GetNeighbourhoodByLocationTests.requestParamLong)
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

