//
//  PoliceUKCrimeEntitiy.swift
//  PoliceUKNetworking
//
//  Created by Deniss Kaibagarovs on 26/07/2020.
//

import Foundation

public struct PoliceUKCrimeEntitiy: Codable, Equatable {
  public let category: String?
  public let location_type: String?
  public let context: String?
  public let persistent_id: String?
  public let id: Int?
  public let location_subtype: String?
  public let month: String?
  public let location: PoliceUKCrimeLocationEntity?
  public let outcome_status: PoliceUKCrimeOutcomeStatusEntity? //TODO would not exist for Outcome
  
  public init(category: String? = nil,
              location_type: String? = nil,
              context: String? = nil,
              persistent_id: String? = nil,
              id: Int? = nil,
              location_subtype: String? = nil,
              month: String? = nil,
              location: PoliceUKCrimeLocationEntity? = nil,
              outcome_status: PoliceUKCrimeOutcomeStatusEntity? = nil) {
    self.category = category
    self.location_type = location_type
    self.context = context
    self.persistent_id = persistent_id
    self.id = id
    self.location_subtype = location_subtype
    self.month = month
    self.location = location
    self.outcome_status = outcome_status
  }
}

public struct PoliceUKCrimeLocationEntity: Codable, Equatable {
  public let latitude: String?
  public let longitude: String?
  public let street: PoliceUKCrimeLocationStreetEntity?
  
  public init(latitude: String? = nil,
              longitude: String? = nil,
              street: PoliceUKCrimeLocationStreetEntity? = nil) {
    self.latitude = latitude
    self.longitude = longitude
    self.street = street
  }
}

public struct PoliceUKCrimeLocationStreetEntity: Codable, Equatable {
  public let id: Int?
  public let name: String?
  
  public init(id: Int? = nil,
              name: String? = nil) {
    self.id = id
    self.name = name
  }
}

public struct PoliceUKCrimeOutcomeStatusEntity: Codable, Equatable {
  public let category: String
  public let date: String
  
  public init(category: String,
              date: String) {
    self.category = category
    self.date = date
  }
}
