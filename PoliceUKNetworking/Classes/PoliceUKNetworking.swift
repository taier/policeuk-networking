
import Foundation
import Alamofire
import RxSwift

public class PoliceUKNetworking {
  
  static let shared = PoliceUKNetworking()
  public static let defaultCrimeCategory = "all-crime"
  
  private let disposeBag = DisposeBag()
  private var sessionManager: Session = AF //default alomafire session manager
  
  // Crime
  let policeUKCrimeLastUpdatedGateway = PoliceUKCrimeLastUpdatedGateway()
  let policeUKCrimeCategoriesGateway = PoliceUKCrimeCategoriesGateway()
  let policeUKCrimesWithNoLocationGateway = PoliceUKCrimesWithNoLocationGateway()
  let policeUKCrimeDataAvailabilityGateway = PoliceUKCrimeDataAvailabilityGateway()
  let policeUKCrimeByLocationGateway = PoliceUKCrimeByLocationGateway()
  let policeUKCrimeByCustomLocationGateway = PoliceUKCrimeByCustomLocationGateway()
  
  // Crime Outcome
  let policeUKCimeOutcomeGateway = PoliceUKCimeOutcomeGateway()
  let policeUKCrimeOutcomeByLocationGateway = PoliceUKCrimeOutcomeByLocationGateway()
  let policeUKCrimeOutcomeByCustomLocationGateway = PoliceUKCrimeOutcomeByCustomLocationGateway()
  
  // Force
  let policeUKForcesListGateway = PoliceUKForcesListGateway()
  let policeUKSpecificForceGateway = PoliceUKSpecificForceGateway()
  let policeUKSeniorOfficersGateway = PoliceUKSeniorOfficersGateway()
  
  // Neighbourhood
  let policeUKNeighbourhoodPrioritiesGateway = PoliceUKNeighbourhoodPrioritiesGateway()
  let policeUKListOfNeighbourhoodsForForceGateway = PoliceUKListOfNeighbourhoodsForForceGateway()
  let policeUKNeighbourhoodTeamGateway = PoliceUKNeighbourhoodTeamGateway()
  let policeUKSpecificNeighbourhoodGateway = PoliceUKSpecificNeighbourhoodGateway()
  let policeUKLocateNeighbourhoodGateway = PoliceUKLocateNeighbourhoodGateway()
  let policeUKNeighbourhoodBoundaryGateway = PoliceUKNeighbourhoodBoundaryGateway()
  
  // Stop and Search
  let policeUKStopAndSearchByForceGateway = PoliceUKStopAndSearchByForceGateway()
  let policeUKStopAndSearchByLocationGateway = PoliceUKStopAndSearchByLocationGateway()
  let policeUKStopAndSearchWithNoLocationGateway = PoliceUKStopAndSearchWithNoLocationGateway()
  let policeUKStopAndSearchByCustomLocationGateway = PoliceUKStopAndSearchByCustomLocationGateway()
  
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
  
  public static func getCrimeDataAvailability(completion:
    @escaping (([PoliceUKCrimeDataAvailabilityEntity]?, Error?)->Void)) {
    shared.policeUKCrimeDataAvailabilityGateway
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
  
  public static func getCrimeOutcomeByLocation(forLocationID: String,
                                               forDate: String? = nil,
                                               completion:
    @escaping (([PoliceUKCrimeOutcome]?, Error?)->Void)) {
    shared.policeUKCrimeOutcomeByLocationGateway
      .getSingle(shared.sessionManager,
                 forLocationID: forLocationID,
                 forDate: forDate)
      .subscribe(onSuccess: { response in
        completion(response, nil)
      }) { error in
        completion(nil, error)
    }.disposed(by: shared.disposeBag)
  }
  
  public static func getCrimeOutcomeByCustomLocation(forLatitude: String,
                                                     forLongitude: String,
                                                     forDate: String? = nil,
                                                     completion:
    @escaping (([PoliceUKCrimeOutcome]?, Error?)->Void)) {
    shared.policeUKCrimeOutcomeByCustomLocationGateway
      .getSingle(shared.sessionManager,
                 forLatitude: forLatitude,
                 forLongitude: forLongitude,
                 forDate: forDate)
      .subscribe(onSuccess: { response in
        completion(response, nil)
      }) { error in
        completion(nil, error)
    }.disposed(by: shared.disposeBag)
  }
  
  public static func getCrimeOutcomeByCustomLocation(forPoly: [String],
                                                     forDate: String? = nil,
                                                     completion:
    @escaping (([PoliceUKCrimeOutcome]?, Error?)->Void)) {
    shared.policeUKCrimeOutcomeByCustomLocationGateway
      .getSingle(shared.sessionManager,
                 forPoly: forPoly,
                 forDate: forDate)
      .subscribe(onSuccess: { response in
        completion(response, nil)
      }) { error in
        completion(nil, error)
    }.disposed(by: shared.disposeBag)
  }
  
  public static func getCrimeByLocation(forLocationID: String,
                                        forDate: String? = nil,
                                        completion:
    @escaping (([PoliceUKCrimeEntitiy]?, Error?)->Void)) {
    shared.policeUKCrimeByLocationGateway
      .getSingle(shared.sessionManager,
                 forLocationID: forLocationID,
                 forDate: forDate)
      .subscribe(onSuccess: { response in
        completion(response, nil)
      }) { error in
        completion(nil, error)
    }.disposed(by: shared.disposeBag)
  }
  
  public static func getCrimeByLocation(forLatitude: String,
                                        forLongitude: String,
                                        forDate: String? = nil,
                                        completion:
    @escaping (([PoliceUKCrimeEntitiy]?, Error?)->Void)) {
    shared.policeUKCrimeByLocationGateway
      .getSingle(shared.sessionManager,
                 forLatitude: forLatitude,
                 forLongitude: forLongitude,
                 forDate: forDate)
      .subscribe(onSuccess: { response in
        completion(response, nil)
      }) { error in
        completion(nil, error)
    }.disposed(by: shared.disposeBag)
  }
  
  public static func getCrimeByCustomLocation(forLatitude: String,
                                              forLongitude: String,
                                              forCrimeCategory: String = defaultCrimeCategory,
                                              forDate: String? = nil,
                                              completion:
    @escaping (([PoliceUKCrimeEntitiy]?, Error?)->Void)) {
    shared.policeUKCrimeByCustomLocationGateway
      .getSingle(shared.sessionManager,
                 forLatitude: forLatitude,
                 forLongitude: forLongitude,
                 forCrimeCategory: forCrimeCategory,
                 forDate: forDate)
      .subscribe(onSuccess: { response in
        completion(response, nil)
      }) { error in
        completion(nil, error)
    }.disposed(by: shared.disposeBag)
  }
  
  public static func getCrimeByCustomLocation(forPoly: [String],
                                              forCrimeCategory: String = defaultCrimeCategory,
                                              forDate: String? = nil,
                                              completion:
    @escaping (([PoliceUKCrimeEntitiy]?, Error?)->Void)) {
    shared.policeUKCrimeByCustomLocationGateway
      .getSingle(shared.sessionManager,
                 forPoly: forPoly,
                 forCrimeCategory: forCrimeCategory,
                 forDate: forDate)
      .subscribe(onSuccess: { response in
        completion(response, nil)
      }) { error in
        completion(nil, error)
    }.disposed(by: shared.disposeBag)
  }
  
  public static func getCrimesWithNoLocation(forCrimeCategory: String = defaultCrimeCategory,
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
  
  public static func getNeighbourhoodByLocation(forLatitude: String,
                                                forLongitude: String,
                                                completion:
    @escaping ((PoliceUKLocateNeighbourhoodEntity?, Error?)->Void)) {
    shared.policeUKLocateNeighbourhoodGateway
      .getSingle(shared.sessionManager,
                 forLatitude: forLatitude,
                 forLongitude: forLongitude)
      .subscribe(onSuccess: { response in
        completion(response, nil)
      }) { error in
        completion(nil, error)
    }.disposed(by: shared.disposeBag)
  }
  
  public static func getNeighbourhoodBoundary(forForce: String,
                                              forNeighbourhood: String,
                                              completion:
    @escaping (([PoliceUKNeighbourhoodBoundaryEntity]?, Error?)->Void)) {
    shared.policeUKNeighbourhoodBoundaryGateway
      .getSingle(shared.sessionManager,
                 forForce: forForce,
                 forNeighbourhood: forNeighbourhood)
      .subscribe(onSuccess: { response in
        completion(response, nil)
      }) { error in
        completion(nil, error)
    }.disposed(by: shared.disposeBag)
  }
  
  public static func getStopAndSearchByForce(forForce: String,
                                             forDate: String? = nil,
                                             completion:
    @escaping (([PoliceUKStopAndSearchEntity]?, Error?)->Void)) {
    shared.policeUKStopAndSearchByForceGateway
      .getSingle(shared.sessionManager,
                 forForce: forForce,
                 forDate: forDate)
      .subscribe(onSuccess: { response in
        completion(response, nil)
      }) { error in
        completion(nil, error)
    }.disposed(by: shared.disposeBag)
  }
  
  public static func getStopAndSearchByLocation(forLocationID: String,
                                                forDate: String? = nil,
                                                completion:
    @escaping (([PoliceUKStopAndSearchEntity]?, Error?)->Void)) {
    shared.policeUKStopAndSearchByLocationGateway
      .getSingle(shared.sessionManager,
                 forLocationID: forLocationID,
                 forDate: forDate)
      .subscribe(onSuccess: { response in
        completion(response, nil)
      }) { error in
        completion(nil, error)
    }.disposed(by: shared.disposeBag)
  }
  
  public static func getStopAndSearchByCustomLocation(forLatitude: String,
                                                      forLongitude: String,
                                                      forDate: String? = nil,
                                                      completion:
    @escaping (([PoliceUKStopAndSearchEntity]?, Error?)->Void)) {
    shared.policeUKStopAndSearchByCustomLocationGateway
      .getSingle(shared.sessionManager,
                 forLatitude: forLatitude,
                 forLongitude: forLongitude,
                 forDate: forDate)
      .subscribe(onSuccess: { response in
        completion(response, nil)
      }) { error in
        completion(nil, error)
    }.disposed(by: shared.disposeBag)
  }
  
  public static func getStopAndSearchByCustomLocation(forPoly: [String],
                                                      forDate: String? = nil,
                                                      completion:
    @escaping (([PoliceUKStopAndSearchEntity]?, Error?)->Void)) {
    shared.policeUKStopAndSearchByCustomLocationGateway
      .getSingle(shared.sessionManager,
                 forPoly: forPoly,
                 forDate: forDate)
      .subscribe(onSuccess: { response in
        completion(response, nil)
      }) { error in
        completion(nil, error)
    }.disposed(by: shared.disposeBag)
  }
  
  public static func getStopAndSearchWithNoLocation(forForce: String,
                                                    forDate: String? = nil,
                                                    completion:
    @escaping (([PoliceUKStopAndSearchEntity]?, Error?)->Void)) {
    shared.policeUKStopAndSearchWithNoLocationGateway
      .getSingle(shared.sessionManager,
                 forForce: forForce,
                 forDate: forDate)
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
