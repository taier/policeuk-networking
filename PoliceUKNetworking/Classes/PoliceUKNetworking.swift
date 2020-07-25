
import Foundation
import Alamofire

public class PoliceUKNetworking {
  public static func getNumberOfCrimes() -> Int {
    return 10
  }
  
  public static func testAF() {
    AF.request("https://data.police.uk/api/crime-last-updated").response { response in
        debugPrint(response)
    }
  }
}
