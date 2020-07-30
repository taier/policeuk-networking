// Created by Deniss Kaibagarovs d.kaibagarov@gmail.com

import Foundation

public struct PoliceUKNeighbourhoodBoundaryEntity: Codable, Equatable {
  public let latitude: String
  public let longitude: String
  
  public init(latitude: String,
              longitude: String) {
    self.latitude = latitude
    self.longitude = longitude
  }
}
