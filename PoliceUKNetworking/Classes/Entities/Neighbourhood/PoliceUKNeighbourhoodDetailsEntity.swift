//
//  PoliceUKForceEntity.swift
//  PoliceUKNetworking
//
//  Created by Deniss Kaibagarovs on 26/07/2020.
//

import Foundation

public struct PoliceUKNeighbourhoodDetailsEntity: Codable, Equatable {
  public let url_force: String?
  public let name: String?
  public let description: String?
  public let id: String?
  public let population: String?
  public let welcome_message: String?
  public let contact_details: PoliceUKNeighbourhoodContactDetails?
  public let links: [PoliceUKNeighbourhoodLink]?
  public let centre: PoliceUKNeighbourhoodCentre?
  public let locations: [PoliceUKNeighbourhoodLocation]?
  
  public init(url_force: String? = nil,
              name: String? = nil,
              description: String? = nil,
              id: String? = nil,
              population: String? = nil,
              welcome_message: String? = nil,
              contact_details: PoliceUKNeighbourhoodContactDetails? = nil,
              links: [PoliceUKNeighbourhoodLink]? = nil,
              centre: PoliceUKNeighbourhoodCentre? = nil,
              locations: [PoliceUKNeighbourhoodLocation]? = nil) {
    self.url_force = url_force
    self.name = name
    self.description = description
    self.id = id
    self.population = population
    self.welcome_message = welcome_message
    self.contact_details = contact_details
    self.links = links
    self.centre = centre
    self.locations = locations
  }
}

public struct PoliceUKNeighbourhoodLocation: Codable, Equatable {
  public let name: String?
  public let longitude: String?
  public let latitude: String?
  public let postcode: String?
  public let address: String?
  public let telephone: String?
  public let type: String?
  public let description: String?
  
  public init(name: String? = nil,
              longitude: String? = nil,
              latitude: String? = nil,
              postcode: String? = nil,
              address: String? = nil,
              telephone: String? = nil,
              type: String? = nil,
              description: String? = nil) {
    self.name = name
    self.longitude = longitude
    self.latitude = latitude
    self.postcode = postcode
    self.address = address
    self.telephone = telephone
    self.type = type
    self.description = description
  }
}

public struct PoliceUKNeighbourhoodLink: Codable, Equatable {
  public let url: String?
  public let description: String?
  public let title: String?
  
  public init(url: String? = nil,
              description: String? = nil,
              title: String? = nil) {
    self.url = url
    self.description = description
    self.title = title
  }
}

public struct PoliceUKNeighbourhoodCentre: Codable, Equatable {
  public let latitude: String?
  public let longitude: String?
  
  public init(latitude: String? = nil,
              longitude: String? = nil) {
    self.latitude = latitude
    self.longitude = longitude
  }
}

public struct PoliceUKNeighbourhoodContactDetails: Codable, Equatable {
  public let email: String?
  public let telephone: String?
  public let mobile: String?
  public let fax: String?
  public let web: String?
  public let address: String?
  public let facebook: String?
  public let twitter: String?
  public let youtube: String?
  public let myspace: String?
  public let bebo: String?
  public let flickr: String?
  public let forum: String?
  public let e_messaging: String?
  public let blog: String?
  public let rss: String?
  
  public init(email: String? = nil,
              telephone: String? = nil,
              mobile: String? = nil,
              fax: String? = nil,
              web: String? = nil,
              address: String? = nil,
              facebook: String? = nil,
              twitter: String? = nil,
              youtube: String? = nil,
              myspace: String? = nil,
              bebo: String? = nil,
              flickr: String? = nil,
              forum: String? = nil,
              e_messaging: String? = nil,
              blog: String? = nil,
              rss: String? = nil) {
    self.email = email
    self.telephone = telephone
    self.mobile = mobile
    self.fax = fax
    self.web = web
    self.address = address
    self.facebook = facebook
    self.twitter = twitter
    self.youtube = youtube
    self.myspace = myspace
    self.bebo = bebo
    self.flickr = flickr
    self.forum = forum
    self.e_messaging = e_messaging
    self.blog = blog
    self.rss = rss
  }
}
