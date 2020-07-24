import XCTest
import PoliceUKNetworking

class Tests: XCTestCase {
    func testExample() {
      XCTAssert(PoliceUKNetworking.getNumberOfCrimes() == 10, "Wrong number of crimes")
    }
}
