
import Foundation
import Alamofire
import RxSwift

public class PoliceUKNetworking {
  
  static let shared = PoliceUKNetworking()
  private let disposeBag = DisposeBag()
  private var sessionManager: Session = AF //default alomafire session manager
  
  let policeUKCrimeLastUpdatedGateway = PoliceUKCrimeLastUpdatedGateway()
  let policeUKCrimeCategoriesGateway = PoliceUKCrimeCategoriesGateway()
  
  let policeUKForcesListGateway = PoliceUKForcesListGateway()
  let policeUKSpecificForceGateway = PoliceUKSpecificForceGateway()
  
  public static func getCrimeDBLaseUpdateDate(completion:
    @escaping ((PoliceUKCrimeLastUpdatedEntity?, Error?)->Void)) {
    shared.policeUKCrimeLastUpdatedGateway
      .getSingle(shared.sessionManager)
      .subscribe(onSuccess: { response in
        completion(response, nil)
      }) { error in
        completion(nil, error)
    }.disposed(by: shared.disposeBag)
  }
  
  public static func getCrimeCategory(forDate: String? = nil,
                                      completion:
    @escaping (([PoliceUKCrimeCategoryEntity]?, Error?)->Void)) {
    shared.policeUKCrimeCategoriesGateway
      .getSingle(shared.sessionManager, forDate: forDate)
      .subscribe(onSuccess: { response in
        completion(response, nil)
      }) { error in
        completion(nil, error)
    }.disposed(by: shared.disposeBag)
  }
  
  public static func getForcesList(completion:
    @escaping (([PoliceUKForceEntity]?, Error?)->Void)) {
    shared.policeUKForcesListGateway
      .getSingle(shared.sessionManager)
      .subscribe(onSuccess: { response in
        completion(response, nil)
      }) { error in
        completion(nil, error)
    }.disposed(by: shared.disposeBag)
  }
  
  public static func getSpecificForce(forForce: String,
                                      completion:
    @escaping ((PoliceUKSpecificForceEntity?, Error?)->Void)) {
    shared.policeUKSpecificForceGateway
      .getSingle(shared.sessionManager, forForce: forForce)
      .subscribe(onSuccess: { response in
        completion(response, nil)
      }) { error in
        completion(nil, error)
    }.disposed(by: shared.disposeBag)
  }
  
  public static func setSession(session: Session) {
    shared.sessionManager = session
  }
}
