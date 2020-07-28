//
//  PoliceUKLocateNeighbourhoodEntity.swift
//  PoliceUKNetworking
//
//  Created by Deniss Kaibagarovs on 27/07/2020.
//

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
