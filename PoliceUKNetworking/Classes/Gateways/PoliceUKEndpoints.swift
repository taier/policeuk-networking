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
  
  public static func forcesList() -> String {
    return "\(APIUrl)/forces"
  }
}
