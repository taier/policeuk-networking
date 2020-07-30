// Created by Deniss Kaibagarovs d.kaibagarov@gmail.com

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
    case forces = "stop-and-search" // "-" cant be parsed because it's invalid as a variable name in swift
  }
}
