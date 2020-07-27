//
//  PoliceUKCrimeDataAvailability.swift
//  PoliceUKNetworking
//
//  Created by Deniss Kaibagarovs on 27/07/2020.
//

import Foundation

public struct PoliceUKCrimeDataAvailabilityEntity: Codable, Equatable {
  public let date: String
  public let forces: [String]?
  
  public init(date: String,
              forces: [String]?) {
    self.date = date
    self.forces = forces
  }
  
  enum CodingKeys: String, CodingKey {
    case date = "date"
    case forces = "stop-and-search" //TODO add info about that
  }
}
