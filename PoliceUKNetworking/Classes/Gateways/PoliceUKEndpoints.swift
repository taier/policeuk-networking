//
//  PoliceUKEndpoints.swift
//  PoliceUKNetworking
//
//  Created by Deniss Kaibagarovs on 26/07/2020.
//

import Foundation

public class PoliceUKEndpoints {
  private static let baseURL = "https://data.police.uk"
  private static let APIUrl = "\(baseURL)/api"
  
  public static func crimeLastUpdated() -> String {
    return "\(APIUrl)/crime-last-updated"
  }
  
  public static func crimeCategories(date: String?) -> String {
    var composed = "\(APIUrl)/crime-categories"
    if let date = date {
      composed = "\(composed)?date=\(date)"
    }
    return composed
  }
  
  public static func crimeOutcome(crime: String) -> String {
    return "\(APIUrl)/outcomes-for-crime/\(crime)"
  }
  
  public static func crimesWithNoLocation(crimeCategory: String,
                                          force: String,
                                          date: String?) -> String {
    var composed = "\(APIUrl)/crimes-no-location?category=\(crimeCategory)&force=\(force)"
    if let date = date {
      composed = "\(composed)&date=\(date)"
    }
    return composed
  }
  
  public static func crimeDataAvailability() -> String {
    return "\(APIUrl)/crimes-street-dates"
  }
  
  public static func forcesList() -> String {
    return "\(APIUrl)/forces"
  }
  
  public static func specificForce(force: String) -> String {
    return "\(APIUrl)/forces/\(force)"
  }
  
  public static func seniorOfficers(force: String) -> String {
    return "\(APIUrl)/forces/\(force)/people"
  }
  
  public static func neighbourhoodPriorities(force: String, neighbourhood: String) -> String {
    return "\(APIUrl)/\(force)/\(neighbourhood)/priorities"
  }
  
  public static func neighbourhoodListForForce(force: String) -> String {
    return "\(APIUrl)/\(force)/neighbourhoods"
  }
  
  public static func neighbourhoodTeam(force: String, neighbourhood: String) -> String {
    return "\(APIUrl)/\(force)/\(neighbourhood)/people"
  }
  
  public static func neighbourhoodDetails(force: String, neighbourhood: String) -> String {
    return "\(APIUrl)/\(force)/\(neighbourhood)"
  }
  
  public static func stopAndSearchByForce(force: String,
                                          date: String?) -> String {
    var composed = "\(APIUrl)/stops-force?force=\(force)"
    if let date = date {
      composed = "\(composed)&date=\(date)"
    }
    return composed
  }
  
  public static func stopAndSearchByLocation(locationID: String,
                                             date: String?) -> String {
    var composed = "\(APIUrl)/stops-at-location?location_id=\(locationID)"
    if let date = date {
      composed = "\(composed)&date=\(date)"
    }
    return composed
  }
  
  public static func stopAndSearchWithNoLocation(force: String,
                                                 date: String?) -> String {
    var composed = "\(APIUrl)/stops-force?force=\(force)"
    if let date = date {
      composed = "\(composed)&date=\(date)"
    }
    return composed
  }
}
