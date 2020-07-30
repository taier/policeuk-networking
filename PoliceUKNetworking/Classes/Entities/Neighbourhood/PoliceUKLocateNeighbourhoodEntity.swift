// Created by Deniss Kaibagarovs d.kaibagarov@gmail.com

import Foundation

public struct PoliceUKLocateNeighbourhoodEntity: Codable, Equatable {
  public let force: String
  public let neighbourhood: String
  
  public init(force: String,
              neighbourhood: String) {
    self.force = force
    self.neighbourhood = neighbourhood
  }
}
