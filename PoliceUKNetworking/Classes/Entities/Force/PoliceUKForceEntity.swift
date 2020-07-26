//
//  PoliceUKForceEntity.swift
//  PoliceUKNetworking
//
//  Created by Deniss Kaibagarovs on 26/07/2020.
//

import Foundation

public struct PoliceUKForceEntity: Codable, Equatable {
  public let id: String
  public let name: String
  
  public init(id: String, name: String) {
    self.id = id
    self.name = name
  }
}
