// Created by Deniss Kaibagarovs d.kaibagarov@gmail.com

import Foundation

public struct PoliceUKCrimeLastUpdatedEntity: Codable, Equatable {
  public let date: String
  
  public init(date: String) {
    self.date = date
  }
}
