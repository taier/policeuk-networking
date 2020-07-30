// Created by Deniss Kaibagarovs d.kaibagarov@gmail.com

import Foundation

public struct PoliceUKNeighbourhoodTeamEntity: Codable, Equatable {
  public let bio: String?
  public let name: String?
  public let rank: String?
  public let contact_details: PoliceUKNeighbourhoodTeamContactDetailsEntity?
  
  public init(bio: String?,
              name: String?,
              rank: String?,
              contact_details: PoliceUKNeighbourhoodTeamContactDetailsEntity?) {
    self.bio = bio
    self.name = name
    self.rank = rank
    self.contact_details = contact_details
  }
}

public struct PoliceUKNeighbourhoodTeamContactDetailsEntity: Codable, Equatable {
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
