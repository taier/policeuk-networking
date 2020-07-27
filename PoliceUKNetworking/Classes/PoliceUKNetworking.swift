
import Foundation
import Alamofire
import RxSwift

public class PoliceUKNetworking {
  
  static let shared = PoliceUKNetworking()
  private let disposeBag = DisposeBag()
  private var sessionManager: Session = AF //default alomafire session manager
  
  let policeUKCrimeLastUpdatedGateway = PoliceUKCrimeLastUpdatedGateway()
  let policeUKCrimeCategoriesGateway = PoliceUKCrimeCategoriesGateway()
  let policeUKCimeOutcomeGateway = PoliceUKCimeOutcomeGateway()
  
  let policeUKForcesListGateway = PoliceUKForcesListGateway()
  let policeUKSpecificForceGateway = PoliceUKSpecificForceGateway()
  let policeUKSeniorOfficersGateway = PoliceUKSeniorOfficersGateway()
  
  let policeUKNeighbourhoodPrioritiesGateway = PoliceUKNeighbourhoodPrioritiesGateway()
  let policeUKListOfNeighbourhoodsForForceGateway = PoliceUKListOfNeighbourhoodsForForceGateway()
  let policeUKNeighbourhoodTeamGateway = PoliceUKNeighbourhoodTeamGateway()
  let policeUKSpecificNeighbourhoodGateway = PoliceUKSpecificNeighbourhoodGateway()
  let policeUKCrimesWithNoLocationGateway = PoliceUKCrimesWithNoLocationGateway()
  
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
  
  public static func getCrimeOutcome(forCrime: String,
                                     completion:
    @escaping ((PoliceUKCrimeOutcomeEntity?, Error?)->Void)) {
    shared.policeUKCimeOutcomeGateway
      .getSingle(shared.sessionManager, forCrime: forCrime)
      .subscribe(onSuccess: { response in
        completion(response, nil)
      }) { error in
        completion(nil, error)
    }.disposed(by: shared.disposeBag)
  }
  
  public static func getCrimesWithNoLocation(forCrimeCategory: String,
                                             forForce: String,
                                             forDate: String? = nil,
                                             completion:
    @escaping (([PoliceUKCrimeEntitiy]?, Error?)->Void)) {
    shared.policeUKCrimesWithNoLocationGateway
      .getSingle(shared.sessionManager,
                 forCrimeCategory: forCrimeCategory,
                 forForce: forForce,
                 forDate: forDate)
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
  
  public static func getSeniorOfficers(forForce: String,
                                       completion:
    @escaping (([PoliceUKSeniorOfficerEntity]?, Error?)->Void)) {
    shared.policeUKSeniorOfficersGateway
      .getSingle(shared.sessionManager, forForce: forForce)
      .subscribe(onSuccess: { response in
        completion(response, nil)
      }) { error in
        completion(nil, error)
    }.disposed(by: shared.disposeBag)
  }
  
  public static func getNeighbourhoodPriorities(forForce: String,
                                                forNeighbourhood: String,
                                                completion:
    @escaping (([PoliceUKNeighbourhoodPrioritiesEntity]?, Error?)->Void)) {
    shared.policeUKNeighbourhoodPrioritiesGateway
      .getSingle(shared.sessionManager,
                 forForce: forForce,
                 forNeighbourhood: forNeighbourhood)
      .subscribe(onSuccess: { response in
        completion(response, nil)
      }) { error in
        completion(nil, error)
    }.disposed(by: shared.disposeBag)
  }
  
  public static func getNeighbourhoods(forForce: String,
                                       completion:
    @escaping (([PoliceUKPoliceUKNeighbourhoodEntity]?, Error?)->Void)) {
    shared.policeUKListOfNeighbourhoodsForForceGateway
      .getSingle(shared.sessionManager,
                 forForce: forForce)
      .subscribe(onSuccess: { response in
        completion(response, nil)
      }) { error in
        completion(nil, error)
    }.disposed(by: shared.disposeBag)
  }
  
  public static func getNeighbourhoodTeam(forForce: String,
                                          forNeighbourhood: String,
                                          completion:
    @escaping (([PoliceUKNeighbourhoodTeamEntity]?, Error?)->Void)) {
    shared.policeUKNeighbourhoodTeamGateway
      .getSingle(shared.sessionManager,
                 forForce: forForce,
                 forNeighbourhood: forNeighbourhood)
      .subscribe(onSuccess: { response in
        completion(response, nil)
      }) { error in
        completion(nil, error)
    }.disposed(by: shared.disposeBag)
  }
  
  public static func getNeighbourhoodDetails(forForce: String,
                                             forNeighbourhood: String,
                                             completion:
    @escaping ((PoliceUKNeighbourhoodDetailsEntity?, Error?)->Void)) {
    shared.policeUKSpecificNeighbourhoodGateway
      .getSingle(shared.sessionManager,
                 forForce: forForce,
                 forNeighbourhood: forNeighbourhood)
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
