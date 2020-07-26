//
//  PoliceUKCrimeCategoryEntity.swift
//  PoliceUKNetworking
//
//  Created by Deniss Kaibagarovs on 26/07/2020.
//

import Foundation

public struct PoliceUKCrimeCategoryEntity: Codable, Equatable {
  public let url: String
  public let name: String
  
  public init(url: String, name: String) {
    self.url = url
    self.name = name
  }
}
