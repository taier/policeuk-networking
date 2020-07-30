// Created by Deniss Kaibagarovs d.kaibagarov@gmail.com

import Foundation

public struct PoliceUKStopAndSearchEntity: Codable, Equatable {
  public let age_range: String?
  public let self_defined_ethnicity: String?
  public let outcome_linked_to_object_of_search: Bool?
  public let datetime: String?
  public let removal_of_more_than_outer_clothing: Bool?
  public let operation: Bool?
  public let officer_defined_ethnicity: String?
  public let object_of_search: String?
  public let involved_person: Bool?
  public let gender: String?
  public let legislation: String?
  public let location: PoliceUKCrimeLocationEntity?
  public let outcome: String?
  public let type: String?
  public let operation_name: String?
  
  public init(age_range: String? = nil,
              self_defined_ethnicity: String? = nil,
              outcome_linked_to_object_of_search: Bool? = nil,
              datetime: String? = nil,
              removal_of_more_than_outer_clothing: Bool? = nil,
              operation: Bool? = nil,
              officer_defined_ethnicity: String? = nil,
              object_of_search: String? = nil,
              involved_person: Bool? = nil,
              gender: String? = nil,
              legislation: String? = nil,
              location: PoliceUKCrimeLocationEntity? = nil,
              outcome: String? = nil,
              type: String? = nil,
              operation_name: String? = nil) {
    self.age_range = age_range
    self.self_defined_ethnicity = self_defined_ethnicity
    self.outcome_linked_to_object_of_search = outcome_linked_to_object_of_search
    self.datetime = datetime
    self.removal_of_more_than_outer_clothing = removal_of_more_than_outer_clothing
    self.operation = operation
    self.officer_defined_ethnicity = officer_defined_ethnicity
    self.object_of_search = object_of_search
    self.involved_person = involved_person
    self.gender = gender
    self.legislation = legislation
    self.location = location
    self.outcome = outcome
    self.type = type
    self.operation_name = operation_name
  }
}
