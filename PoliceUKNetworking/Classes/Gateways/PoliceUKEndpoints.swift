//
//  PoliceUKEndpoints.swift
//  PoliceUKNetworking
//
//  Created by Deniss Kaibagarovs on 26/07/2020.
//

import Foundation

class PoliceUKEndpoints {
  private static let baseURL = "https://data.police.uk"
  private static let APIUrl = "\(baseURL)/api"
  
  public static func crimeLastUpdated() -> String {
    return "\(APIUrl)/crime-last-updated"
  }
}
