import XCTest
import Mocker
import Alamofire
import PoliceUKNetworking

class GetCrimeDBLaseUpdateDateTests: XCTestCaseBase {
  
  private let extectedResponse = PoliceUKCrimeLastUpdatedEntity(date: "2020-05-11")
  private let apiEndpoint = URL(string: PoliceUKEndpoints.crimeLastUpdated())!
  
  func testSuccess() {
    let requestExpectation = expectation(description: "Request should finish")
    
    let mockedData = try! JSONEncoder().encode(extectedResponse)
    let mock = Mock(url: apiEndpoint, dataType: .json, statusCode: 200, data: [Mock.HTTPMethod.get : mockedData])
    mock.register()
    
    PoliceUKNetworking.getCrimeDBLaseUpdateDate { (entity, error) in
      XCTAssertNotNil(entity, "getCrimeDBLaseUpdateDate entity is null on success")
      XCTAssertNil(error, "getCrimeDBLaseUpdateDate error is not null on success")
      requestExpectation.fulfill()
    }
    
    wait(for: [requestExpectation], timeout: 5.0)
  }
  
  func testError() {
    let requestExpectation = expectation(description: "Request should finish")
    
    let mock = Mock(url: apiEndpoint, dataType: .json, statusCode: 400, data: [Mock.HTTPMethod.get : Data()])
    mock.register()
    
    PoliceUKNetworking.getCrimeDBLaseUpdateDate { (entity, error) in
      XCTAssertNil(entity, "getCrimeDBLaseUpdateDate entity is not null on error")
      XCTAssertNotNil(error, "getCrimeDBLaseUpdateDate error is null on error")
    
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
