// Created by Deniss Kaibagarovs d.kaibagarov@gmail.com

import Foundation

public struct PoliceUKCrimeOutcomeRootEntity: Codable, Equatable {
  public let outcomes: [PoliceUKCrimeOutcomeEntity]?
  public let crime: PoliceUKCrimeEntitiy?
  
  public init(outcomes: [PoliceUKCrimeOutcomeEntity]? = nil,
              crime: PoliceUKCrimeEntitiy? = nil) {
    self.outcomes = outcomes
    self.crime = crime
  }
}

public struct PoliceUKCrimeOutcomeEntity: Codable, Equatable {
  public let date: String?
  public let person_id: String?
  public let category: PoliceUKCrimeOutcomeCategoryEntity?
  public let crime: PoliceUKCrimeEntitiy? // TODO only for a crime outcome by location
  
  public init(date: String? = nil,
              person_id: String? = nil,
              category: PoliceUKCrimeOutcomeCategoryEntity? = nil,
              crime: PoliceUKCrimeEntitiy? = nil) {
    self.date = date
    self.person_id = person_id
    self.category = category
    self.crime = crime
  }
}

public struct PoliceUKCrimeOutcomeCategoryEntity: Codable, Equatable {
  public let code: String?
  public let name: String?
  
  public init(code: String?,
              name: String?) {
    self.code = code
    self.name = name
  }
}
