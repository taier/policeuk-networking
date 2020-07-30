// Created by Deniss Kaibagarovs d.kaibagarov@gmail.com

import Foundation

public struct PoliceUKNeighbourhoodPrioritiesEntity: Codable, Equatable {
  public let action: String?
  public let issue: String?
  public let issue_date: String?
  public let action_date: String?
  
  public init(action: String? = nil,
              issue: String? = nil,
              issue_date: String? = nil,
              action_date: String? = nil) {
    self.action = action
    self.issue = issue
    self.issue_date = issue_date
    self.action_date = action_date
  }
  
  enum CodingKeys: String, CodingKey {
    case action = "action"
    case issue = "issue"
    case issue_date = "issue-date" // "-" cant be parsed because it's invalid as a variable name in swift
    case action_date = "action-date" // "-" cant be parsed because it's invalid as a variable name in swift
  }
}
