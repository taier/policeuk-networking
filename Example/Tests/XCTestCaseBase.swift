//  Created by Deniss Kaibagarovs d.kaibagarov@gmail.com

import PoliceUKNetworking
import Foundation
import Alamofire
import XCTest
import Mocker

class XCTestCaseBase: XCTestCase {
  
  override func setUp() {
    let configuration = URLSessionConfiguration.af.default
    configuration.protocolClasses = [MockingURLProtocol.self] + (configuration.protocolClasses ?? [])
    let sessionManager = Session(configuration: configuration)
    PoliceUKNetworking.setSession(session: sessionManager)
  }
}
