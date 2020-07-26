//
//  PoliceUKCrimeLastupdated.swift
//  PoliceUKNetworking
//
//  Created by Deniss Kaibagarovs on 25/07/2020.
//

import Foundation

public struct PoliceUKCrimeLastUpdatedEntity: Codable, Equatable {
  public let date: String
  
  public init(date: String) {
    self.date = date
  }
}
