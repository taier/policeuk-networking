//
//  PoliceUKCrimeOutcomeEntity.swift
//  PoliceUKNetworking
//
//  Created by Deniss Kaibagarovs on 26/07/2020.
//

import Foundation

public struct PoliceUKCrimeOutcomeEntity: Codable, Equatable {
  public let outcomes: [PoliceUKCrimeOutcome]?
  public let crime: PoliceUKCrimeEntitiy?
  
  public init(outcomes: [PoliceUKCrimeOutcome]? = nil,
              crime: PoliceUKCrimeEntitiy? = nil) {
    self.outcomes = outcomes
    self.crime = crime
  }
}

public struct PoliceUKCrimeOutcome: Codable, Equatable {
  public let date: String?
  public let person_id: String?
  
  public init(date: String? = nil,
              person_id: String? = nil) {
    self.date = date
    self.person_id = person_id
  }
}

public struct PoliceUKCrimeOutcomeCategory: Codable, Equatable {
  public let code: String?
  public let name: String?
  
  public init(code: String?,
              name: String?) {
    self.code = code
    self.name = name
  }
}
