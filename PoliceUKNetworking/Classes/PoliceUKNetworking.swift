
import Foundation
import RxSwift

public class PoliceUKNetworking {
  
  static let shared = PoliceUKNetworking()
  let disposeBag = DisposeBag()
  
  let policeUKCrimeLastUpdatedGateway = PoliceUKCrimeLastUpdatedGateway()
  
  public static func getCrimeDBLaseUpdateDate(completion:
    @escaping ((PoliceUKCrimeLastUpdatedEntity?, Error?)->Void)) {
    shared.policeUKCrimeLastUpdatedGateway
      .getSingle()
      .subscribe(onSuccess: { date in
      completion(date, nil)
    }) { error in
      completion(nil, error)
    }.disposed(by: shared.disposeBag)
  }
}
