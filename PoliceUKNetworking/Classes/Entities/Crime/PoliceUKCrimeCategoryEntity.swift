// Created by Deniss Kaibagarovs d.kaibagarov@gmail.com

import Foundation

public struct PoliceUKCrimeCategoryEntity: Codable, Equatable {
  public let url: String
  public let name: String
  
  public init(url: String, name: String) {
    self.url = url
    self.name = name
  }
}
