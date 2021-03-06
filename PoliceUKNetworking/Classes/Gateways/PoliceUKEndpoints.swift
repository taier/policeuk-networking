// Created by Deniss Kaibagarovs d.kaibagarov@gmail.com

import Foundation
import Alamofire

public class PoliceUKEndpoints {
  private static let baseURL = "https://data.police.uk"
  private static let APIUrl = "\(baseURL)/api"
  
  public static func crimeLastUpdated() -> String {
    return "\(APIUrl)/crime-last-updated"
  }
  
  public static func crimeCategories(date: String?) -> String {
    var composed = "\(APIUrl)/crime-categories"
    if let date = date {
      composed = "\(composed)?date=\(date)"
    }
    return composed
  }
  
  public static func crimeOutcome(crime: String) -> String {
    return "\(APIUrl)/outcomes-for-crime/\(crime)"
  }
  
  public static func crimeOutcomeByLocation(locationID: String,
                                            date: String?) -> String {
    if let date = date {
      return "\(APIUrl)/outcomes-at-location?date=\(date)&location_id=\(locationID)"
    } else {
      return "\(APIUrl)/outcomes-at-location?location_id=\(locationID)"
    }
  }
  
  public static func crimeOutcomeByCustomLocation(lat: String,
                                                  lng: String,
                                                  date: String?) -> String {
    if let date = date {
      return "\(APIUrl)/outcomes-at-location?date=\(date)&lat=\(lat)&lng=\(lng)"
    } else {
      return "\(APIUrl)/outcomes-at-location?lat=\(lat)&lng=\(lng)"
    }
  }
  
  public static func crimeOutcomeByCustomLocation(poly: [String],
                                                  date: String?) -> String {
    if let date = date {
      return "\(APIUrl)/outcomes-at-location?date=\(date)&poly=\(poly.joined(separator: ":"))"
    } else {
      return "\(APIUrl)/outcomes-at-location?poly=\(poly.joined(separator: ":"))"
    }
  }
  
  public static func crimesWithNoLocation(crimeCategory: String,
                                          force: String,
                                          date: String?) -> String {
    var composed = "\(APIUrl)/crimes-no-location?category=\(crimeCategory)&force=\(force)"
    if let date = date {
      composed = "\(composed)&date=\(date)"
    }
    return composed
  }
  
  public static func crimeByLocation(locationID: String,
                                     date: String?) -> String {
    if let date = date {
      return "\(APIUrl)/crimes-at-location?date=\(date)&location_id=\(locationID)"
    } else {
      return "\(APIUrl)/crimes-at-location?location_id=\(locationID)"
    }
  }
  
  public static func crimeByLocation(lat: String,
                                     lng: String,
                                     date: String?) -> String {
    if let date = date {
      return "\(APIUrl)/crimes-at-location?date=\(date)&lat=\(lat)&lng=\(lng)"
    } else {
      return "\(APIUrl)/crimes-at-location?lat=\(lat)&lng=\(lng)"
    }
  }
  
  public static func crimeByCustomLocation(lat: String,
                                           lng: String,
                                           crimeCategory: String,
                                           date: String?) -> String {
    if let date = date {
      return "\(APIUrl)/crimes-street/\(crimeCategory)?lat=\(lat)&lng=\(lng)&date=\(date)"
    } else {
      return "\(APIUrl)/crimes-street/\(crimeCategory)?lat=\(lat)&lng=\(lng)"
    }
  }
  
  public static func crimeByCustomLocation(crimeCategory: String) -> String {
    return "\(APIUrl)/crimes-street/\(crimeCategory)"
  }
  
  public static func composePolyParams(poly: [String], date: String?) -> Parameters {
    if let date = date {
      return ["poly":"\(poly.joined(separator: ":"))", "date": "\(date)"]
    } else {
      return ["poly":"\(poly.joined(separator: ":"))"]
    }
  }
  
  public static func crimeDataAvailability() -> String {
    return "\(APIUrl)/crimes-street-dates"
  }
  
  public static func forcesList() -> String {
    return "\(APIUrl)/forces"
  }
  
  public static func specificForce(force: String) -> String {
    return "\(APIUrl)/forces/\(force)"
  }
  
  public static func seniorOfficers(force: String) -> String {
    return "\(APIUrl)/forces/\(force)/people"
  }
  
  public static func neighbourhoodPriorities(force: String, neighbourhood: String) -> String {
    return "\(APIUrl)/\(force)/\(neighbourhood)/priorities"
  }
  
  public static func neighbourhoodListForForce(force: String) -> String {
    return "\(APIUrl)/\(force)/neighbourhoods"
  }
  
  public static func neighbourhoodTeam(force: String, neighbourhood: String) -> String {
    return "\(APIUrl)/\(force)/\(neighbourhood)/people"
  }
  
  public static func neighbourhoodDetails(force: String, neighbourhood: String) -> String {
    return "\(APIUrl)/\(force)/\(neighbourhood)"
  }
  
  public static func neighbourhoodBoundary(force: String, neighbourhood: String) -> String {
    return "\(APIUrl)/\(force)/\(neighbourhood)/boundary"
  }
  
  public static func locateNeighbourhood(lat: String,
                                         lng: String) -> String {
    return "\(APIUrl)/locate-neighbourhood?q=\(lat),\(lng)"
  }
  
  public static func stopAndSearchByForce(force: String,
                                          date: String?) -> String {
    var composed = "\(APIUrl)/stops-force?force=\(force)"
    if let date = date {
      composed = "\(composed)&date=\(date)"
    }
    return composed
  }
  
  public static func stopAndSearchByLocation(locationID: String,
                                             date: String?) -> String {
    var composed = "\(APIUrl)/stops-at-location?location_id=\(locationID)"
    if let date = date {
      composed = "\(composed)&date=\(date)"
    }
    return composed
  }
  
  public static func stopAndSearchByCustomLocation(lat: String,
                                                   lng: String,
                                                   date: String?) -> String {
    var composed = "\(APIUrl)/stops-street?lat=\(lat)&lng=\(lng)"
    if let date = date {
      composed = "\(composed)&date=\(date)"
    }
    return composed
  }
  
  public static func stopAndSearchByCustomLocation(poly: [String],
                                                   date: String?) -> String {
    var composed = "\(APIUrl)/stops-street?poly=\(poly.joined(separator: ":"))"
    if let date = date {
      composed = "\(composed)&date=\(date)"
    }
    return composed
  }
  
  public static func stopAndSearchWithNoLocation(force: String,
                                                 date: String?) -> String {
    var composed = "\(APIUrl)/stops-force?force=\(force)"
    if let date = date {
      composed = "\(composed)&date=\(date)"
    }
    return composed
  }
}
