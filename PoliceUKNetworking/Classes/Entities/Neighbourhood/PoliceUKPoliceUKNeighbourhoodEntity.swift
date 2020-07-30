// Created by Deniss Kaibagarovs d.kaibagarov@gmail.com

import Foundation

public struct PoliceUKPoliceUKNeighbourhoodEntity: Codable, Equatable {
  public let id: String
  public let name: String
  
  public init(id: String,
              name: String) {
    self.id = id
    self.name = name
  }
}
