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
    if let date = date {
      return "\(APIUrl)/crime-categories?date=\(date)"
    } else {
      return "\(APIUrl)/crime-categories"
    }
  }
  
  public static func crimeOutcome(crime: String) -> String {
     return "\(APIUrl)/outcomes-for-crime/\(crime)"
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
}
