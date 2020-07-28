//
//  PoliceUKNeighbourhoodBoundaryEntity.swift
//  PoliceUKNetworking
//
//  Created by Deniss Kaibagarovs on 28/07/2020.
//

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
