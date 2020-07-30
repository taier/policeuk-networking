//
//  PoliceUKSpecificForceEntity.swift
//  PoliceUKNetworking
//
//  Created by Deniss Kaibagarovs on 26/07/2020.
//

import Foundation

public struct PoliceUKSpecificForceEntity: Codable, Equatable {
  public let id: String
  public let name: String
  public let description: String?
  public let url: String?
  public let telephone: String?
  public let engagement_methods: [PoliceUKSpecificForceEngagementMethodEntity]?
  
  public init(id: String,
              name: String,
              description: String? = nil,
              url: String? = nil,
              telephone: String? = nil,
              engagement_methods: [PoliceUKSpecificForceEngagementMethodEntity]? = nil) {
    self.id = id
    self.name = name
    self.description = description
    self.url = url
    self.telephone = telephone
    self.engagement_methods = engagement_methods
  }
}

public struct PoliceUKSpecificForceEngagementMethodEntity: Codable, Equatable {
  public let url: String?
  public let type: String?
  public let description: String?
  public let title: String?
  
  public init(url: String? = nil,
              type: String? = nil,
              description: String? = nil,
              title: String? = nil) {
    self.url = url
    self.type = type
    self.description = description
    self.title = title
  }
}
