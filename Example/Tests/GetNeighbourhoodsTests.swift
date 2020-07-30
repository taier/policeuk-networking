//  Created by Deniss Kaibagarovs d.kaibagarov@gmail.com

import XCTest
import Mocker
import Alamofire
import PoliceUKNetworking

class GetNeighbourhoodsTests: XCTestCaseBase {
  
  private static let requestParam = "force-test"
  private let expectedResponse = [PoliceUKPoliceUKNeighbourhoodEntity(id: "test-id-1", name: "test-name-1"),
                                  PoliceUKPoliceUKNeighbourhoodEntity(id: "test-id-2", name: "test-name-2")]
  private let apiEndpoint = URL(string: PoliceUKEndpoints.neighbourhoodListForForce(force: requestParam))!
  
  func testSuccess() {
    let requestExpectation = expectation(description: "Request should finish")
    
    let mockedData = try! JSONEncoder().encode(expectedResponse)
    let mock = Mock(url: apiEndpoint, dataType: .json, statusCode: 200, data: [Mock.HTTPMethod.get : mockedData])
    mock.register()
    
    PoliceUKNetworking.getNeighbourhoods(forForce: GetNeighbourhoodsTests.requestParam)
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
    
    PoliceUKNetworking.getNeighbourhoods(forForce: GetNeighbourhoodsTests.requestParam)
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
