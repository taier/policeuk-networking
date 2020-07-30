/*
 Created by Deniss Kaibagarovs d.kaibagarov@gmail.com
 Full API documentation availabe at https://data.police.uk/docs/
 */

import Foundation
import Alamofire
import RxSwift

public class PoliceUKNetworking {
  
  private static let shared = PoliceUKNetworking()
  private let disposeBag = DisposeBag()
  private var sessionManager: Session = AF //default alomafire session manager
  
  // Crime
  private let policeUKCrimeLastUpdatedGateway = PoliceUKCrimeLastUpdatedGateway()
  private let policeUKCrimeCategoriesGateway = PoliceUKCrimeCategoriesGateway()
  private let policeUKCrimesWithNoLocationGateway = PoliceUKCrimesWithNoLocationGateway()
  private let policeUKCrimeDataAvailabilityGateway = PoliceUKCrimeDataAvailabilityGateway()
  private let policeUKCrimeByLocationGateway = PoliceUKCrimeByLocationGateway()
  private let policeUKCrimeByCustomLocationGateway = PoliceUKCrimeByCustomLocationGateway()
  
  // Crime Outcome
  private let policeUKCimeOutcomeGateway = PoliceUKCimeOutcomeGateway()
  private let policeUKCrimeOutcomeByLocationGateway = PoliceUKCrimeOutcomeByLocationGateway()
  private let policeUKCrimeOutcomeByCustomLocationGateway = PoliceUKCrimeOutcomeByCustomLocationGateway()
  
  // Force
  private let policeUKForcesListGateway = PoliceUKForcesListGateway()
  private let policeUKSpecificForceGateway = PoliceUKSpecificForceGateway()
  private let policeUKSeniorOfficersGateway = PoliceUKSeniorOfficersGateway()
  
  // Neighbourhood
  private let policeUKNeighbourhoodPrioritiesGateway = PoliceUKNeighbourhoodPrioritiesGateway()
  private let policeUKListOfNeighbourhoodsForForceGateway = PoliceUKListOfNeighbourhoodsForForceGateway()
  private let policeUKNeighbourhoodTeamGateway = PoliceUKNeighbourhoodTeamGateway()
  private let policeUKSpecificNeighbourhoodGateway = PoliceUKSpecificNeighbourhoodGateway()
  private let policeUKLocateNeighbourhoodGateway = PoliceUKLocateNeighbourhoodGateway()
  private let policeUKNeighbourhoodBoundaryGateway = PoliceUKNeighbourhoodBoundaryGateway()
  
  // Stop and Search
  private let policeUKStopAndSearchByForceGateway = PoliceUKStopAndSearchByForceGateway()
  private let policeUKStopAndSearchByLocationGateway = PoliceUKStopAndSearchByLocationGateway()
  private let policeUKStopAndSearchWithNoLocationGateway = PoliceUKStopAndSearchWithNoLocationGateway()
  private let policeUKStopAndSearchByCustomLocationGateway = PoliceUKStopAndSearchByCustomLocationGateway()
  
  /// Default crime category that would be used in getCrimes if no supplied
  public static let defaultCrimeCategory = "all-crime"
  
  //MARK: - Crime
  
  /// Crime data in the API is updated once a month. Find out when it was last updated.
  /// Month of latest crime data in ISO format.
  /// The day is irrelevant and is only there to keep a standard formatted date.
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
  
  /// Return a list of available data sets.
  /// 2020-05, 2020-04, 2020-03 etc.
  /// Is needed for construction of requests with the date since if you go over a last available date
  /// you would hit an error
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
  
  /// Returns a list of valid crime categories for a given date.
  /// - Parameters:
  ///   - forDate: "2020-05" or the latest available month if not set
  public static func getCrimeCategories(forDate: String? = nil,
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
  
  /// Returns the outcomes (case history) for the specified crime. Crime ID is 64-character identifier, as returned by other API methods.
  /// Note: Outcomes are not available for the Police Service of Northern Ireland.
  /// - Parameters:
  ///   - forCrimeID: Crime ID (persistent_id) that is obtained by other methods
  public static func getCrimeOutcome(forCrimeID: String,
                                     completion:
    @escaping ((PoliceUKCrimeOutcomeRootEntity?, Error?)->Void)) {
    shared.policeUKCimeOutcomeGateway
      .getSingle(shared.sessionManager, forCrime: forCrimeID)
      .subscribe(onSuccess: { response in
        completion(response, nil)
      }) { error in
        completion(nil, error)
    }.disposed(by: shared.disposeBag)
  }
  
  
  /// Returns just the crimes which occurred at the specified location, rather than those within a radius. If given latitude and longitude, finds the nearest pre-defined location and returns the crimes which occurred there.
  /// If you're allowing users to search for locations in Scotland, please make it clear that, since only the British Transport Police provide data for Scotland, crime levels may appear much lower than they really are.
  /// - Parameters:
  ///   - forLocationID: Crimes and outcomes are mapped to specific locations on the map. Valid IDs are returned by other methods (new and existing) which return location information.
  ///   - forDate: "2020-05" or the latest available month if not set
  public static func getCrimesByLocation(forLocationID: String,
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
  
  /// Returns just the crimes which occurred at the specified location, rather than those within a radius. If given latitude and longitude, finds the nearest pre-defined location and returns the crimes which occurred there.
  /// If you're allowing users to search for locations in Scotland, please make it clear that, since only the British Transport Police provide data for Scotland, crime levels may appear much lower than they really are.
  /// - Parameters:
  ///   - forLatitude: "52.62972"
  ///   - forLongitude: "-1.131592"
  ///   - forDate: "2020-05" or the latest available month if not set
  public static func getCrimesByLocation(forLatitude: String,
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
  
  /// Crimes at street-level; either within a 1 mile radius of a single point, or within a custom area.
  /// - Parameters:
  ///   - forLatitude: "52.62972"
  ///   - forLongitude: "-1.131592"
  ///   - forCrimeCategory: getCrimeCategories or all-crime if not set
  ///   - forDate: "2020-05" or the latest available month if not set
  public static func getCrimesByCustomLocation(forLatitude: String,
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
  
  /// Crimes at street-level; either within a 1 mile radius of a single point, or within a custom area.
  /// - Parameters:
  ///   - forPoly: The lat/lng pairs which define the boundary of the custom area ["52.268,0.543", "52.794,0.238"]
  ///   - forCrimeCategory: getCrimeCategories or all-crime if not set
  ///   - forDate: "2020-05" or the latest available month if not set
  public static func getCrimesByCustomLocation(forPoly: [String],
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
  
  /// Returns a list of crimes that could not be mapped to a location.
  /// - Parameters:
  ///   - forCrimeCategory: getCrimeCategories or all-crime if not set
  ///   - forForce: use getForcesList to get all available forces
  ///   - forDate: "2020-05" or the latest available month if not set
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
  
  //MARK: - Crime Outcome
  
  /// Returns just the crime outcomes at the specified location, rather than those within a radius.
  /// Note: Outcomes are not available for the Police Service of Northern Ireland.
  /// - Parameters:
  ///   - forLocationID: Crimes and outcomes are mapped to specific locations on the map. Valid IDs are returned by other methods (new and existing) which return location information.
  ///   - forDate: "2020-05" or the latest available month if not set
  public static func getCrimeOutcomesByLocation(forLocationID: String,
                                                forDate: String? = nil,
                                                completion:
    @escaping (([PoliceUKCrimeOutcomeEntity]?, Error?)->Void)) {
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
  
  /// Crime Outcomes at street-level; either within a 1 mile radius of a single point, or within a custom area.
  /// - Parameters:
  ///   - forLatitude: "52.62972"
  ///   - forLongitude: "-1.131592"
  ///   - forDate: "2020-05" or the latest available month if not set
  public static func getCrimeOutcomesByCustomLocation(forLatitude: String,
                                                      forLongitude: String,
                                                      forDate: String? = nil,
                                                      completion:
    @escaping (([PoliceUKCrimeOutcomeEntity]?, Error?)->Void)) {
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
  
  /// Crime Outcomes at street-level; either within a 1 mile radius of a single point, or within a custom area.
  /// - Parameters:
  ///   - forPoly: The lat/lng pairs which define the boundary of the custom area ["52.268,0.543", "52.794,0.238"]
  ///   - forDate: "2020-05" or the latest available month if not set
  public static func getCrimeOutcomesByCustomLocation(forPoly: [String],
                                                      forDate: String? = nil,
                                                      completion:
    @escaping (([PoliceUKCrimeOutcomeEntity]?, Error?)->Void)) {
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
  
  //MARK: - Force
  
  /// A list of all the police forces available via the API except the British Transport Police, which is excluded from the list returned.
  /// Unique force identifiers obtained here are used in requests for force-specific data via other methods.
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
  
  /// Full description of a force
  /// - Parameters:
  ///   - forForce: use getForcesList to get all available forces
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
  
  /// Full description of people who are working for a force
  /// - Parameters:
  ///   - forForce: use getForcesList to get all available forces
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
  
  //MARK: - Neighbourhood
  
  /// Neighbourhood priorities
  /// - Parameters:
  ///   - forForce: use getForcesList to get all available forces
  ///   - forNeighbourhood: use getNeighbourhoods to get all available Neighbourhoods for a force
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
  
  /// List of neighbourhoods for a force
  /// - Parameters:
  ///   - forForce: use getForcesList to get all available forces
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
  
  /// Full description of neighbourhood team
  /// - Parameters:
  ///   - forForce: use getForcesList to get all available forces
  ///   - forNeighbourhood: use getNeighbourhoods to get all available Neighbourhoods for a force
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
  
  /// Full description of neighbourhood
  /// - Parameters:
  ///   - forForce: use getForcesList to get all available forces
  ///   - forNeighbourhood: use getNeighbourhoods to get all available Neighbourhoods for a force
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
  
  /// Find the neighbourhood policing team responsible for a particular area.
  /// - Parameters:
  ///   - forLatitude: "52.62972"
  ///   - forLongitude: "-1.131592"
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
  
  /// A list of latitude/longitude pairs that make up the boundary of a neighbourhood.
  /// - Parameters:
  ///   - forForce: use getForcesList to get all available forces
  ///   - forNeighbourhood: use getNeighbourhoods to get all available Neighbourhoods for a force
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
  
  //MARK: - Stop and Search
  
  /// Stop and searches reported by a particular force
  /// - Parameters:
  ///   - forForce: use getForcesList to get all available forces
  ///   - forDate: "2020-05" or the latest available month if not set
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
  
  /// Stop and searches at a particular location.
  /// - Parameters:
  ///   - forLocationID: Crimes and outcomes are mapped to specific locations on the map. Valid IDs are returned by other methods (new and existing) which return location information.
  ///   - forDate: "2020-05" or the latest available month if not set
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
  
  /// Stop and searches at street-level; either within a 1 mile radius of a single point, or within a custom area.
  /// - Parameters:
  ///   - forLatitude: "52.62972"
  ///   - forLongitude: "-1.131592"
  ///   - forDate: "2020-05" or the latest available month if not set
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
  
  /// Stop and searches at street-level; either within a 1 mile radius of a single point, or within a custom area.
  /// - Parameters:
  ///   - forPoly: The lat/lng pairs which define the boundary of the custom area ["52.268,0.543", "52.794,0.238"]
  ///   - forDate: "2020-05" or the latest available month if not set
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
  
  /// Stop and searches that could not be mapped to a location.
  /// - Parameters:
  ///   - forForce: use getForcesList to get all available forces
  ///   - forDate: "2020-05" or the latest available month if not set
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
  
  //MARK: - Other
  
  /// Used for tests to mock requests
  /// - Parameter session: Foundation.Session
  public static func setSession(session: Session) {
    shared.sessionManager = session
  }
}
