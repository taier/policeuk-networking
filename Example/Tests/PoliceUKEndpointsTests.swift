//  Created by Deniss Kaibagarovs d.kaibagarov@gmail.com

import XCTest
import PoliceUKNetworking

class PoliceUKEndpointsTests: XCTestCaseBase {
  
  private static let baseURL = "https://data.police.uk"
  private let APIUrl = "\(baseURL)/api"
  
  private let testDate = "2020-05"
  private let testLat = "111"
  private let testLng = "111"
  private let testLocationID = "8888"
  private let testPoly = ["1","2"]
  private let testForce = "city-of-london"
  private let testCrimeCategory = "all-criems"
  private let testNeighbourhood = "neighbourhood-test"
  
  func testCrimeLastUpdated() {
    XCTAssertEqual(PoliceUKEndpoints.crimeLastUpdated(), "\(APIUrl)/crime-last-updated")
  }
  
  func testCrimeCategories() {
    XCTAssertEqual(PoliceUKEndpoints.crimeCategories(date: nil), "\(APIUrl)/crime-categories")
    XCTAssertEqual(PoliceUKEndpoints.crimeCategories(date: testDate), "\(APIUrl)/crime-categories?date=\(testDate)")
  }
  
  func testCrimeOutcome() {
    XCTAssertEqual(PoliceUKEndpoints.crimeOutcome(crime: testCrimeCategory), "\(APIUrl)/outcomes-for-crime/\(testCrimeCategory)")
  }
  
  func testCrimeOutcomeByLocation() {
    XCTAssertEqual(PoliceUKEndpoints.crimeOutcomeByLocation(locationID: testLocationID,
                                                            date: nil),
                   "\(APIUrl)/outcomes-at-location?location_id=\(testLocationID)")
    XCTAssertEqual(PoliceUKEndpoints.crimeOutcomeByLocation(locationID: testLocationID,
                                                            date: testDate),
                   "\(APIUrl)/outcomes-at-location?date=\(testDate)&location_id=\(testLocationID)")
  }
  
  func testCrimeOutcomeByCustomLocation() {
    XCTAssertEqual(PoliceUKEndpoints.crimeOutcomeByCustomLocation(lat: testLat,
                                                                  lng: testLng,
                                                                  date: nil),
                   "\(APIUrl)/outcomes-at-location?lat=\(testLat)&lng=\(testLng)")
    XCTAssertEqual(PoliceUKEndpoints.crimeOutcomeByCustomLocation(lat: testLat,
                                                                  lng: testLng,
                                                                  date: testDate),
                   "\(APIUrl)/outcomes-at-location?date=\(testDate)&lat=\(testLat)&lng=\(testLng)")
    
    XCTAssertEqual(PoliceUKEndpoints.crimeOutcomeByCustomLocation(poly: testPoly,
                                                                  date: nil),
                   "\(APIUrl)/outcomes-at-location?poly=\(testPoly.joined(separator: ":"))")
    XCTAssertEqual(PoliceUKEndpoints.crimeOutcomeByCustomLocation(poly: testPoly,
                                                                  date: testDate),
                   "\(APIUrl)/outcomes-at-location?date=\(testDate)&poly=\(testPoly.joined(separator: ":"))")
  }
  
  func testCrimesWithNoLocation() {
    XCTAssertEqual(PoliceUKEndpoints.crimesWithNoLocation(crimeCategory: testCrimeCategory,
                                                          force: testForce,
                                                          date: nil),
                   "\(APIUrl)/crimes-no-location?category=\(testCrimeCategory)&force=\(testForce)")
    
    XCTAssertEqual(PoliceUKEndpoints.crimesWithNoLocation(crimeCategory: testCrimeCategory,
                                                          force: testForce,
                                                          date: testDate),
                   "\(APIUrl)/crimes-no-location?category=\(testCrimeCategory)&force=\(testForce)&date=\(testDate)")
  }
  
  func testCrimeByLocation() {
    XCTAssertEqual(PoliceUKEndpoints.crimeByLocation(locationID: testLocationID,
                                                     date: nil),
                   "\(APIUrl)/crimes-at-location?location_id=\(testLocationID)")
    XCTAssertEqual(PoliceUKEndpoints.crimeByLocation(locationID: testLocationID,
                                                     date: testDate),
                   "\(APIUrl)/crimes-at-location?date=\(testDate)&location_id=\(testLocationID)")
    
    XCTAssertEqual(PoliceUKEndpoints.crimeByLocation(lat: testLat,
                                                     lng: testLng,
                                                     date: nil),
                   "\(APIUrl)/crimes-at-location?lat=\(testLat)&lng=\(testLng)")
    XCTAssertEqual(PoliceUKEndpoints.crimeByLocation(lat: testLat,
                                                     lng: testLng,
                                                     date: testDate),
                   "\(APIUrl)/crimes-at-location?date=\(testDate)&lat=\(testLat)&lng=\(testLng)")
  }
  
  func testCrimeByCustomLocation() {
    XCTAssertEqual(PoliceUKEndpoints.crimeByCustomLocation(lat: testLat,
                                                           lng: testLng,
                                                           crimeCategory: testCrimeCategory,
                                                           date: nil),
                   "\(APIUrl)/crimes-street/\(testCrimeCategory)?lat=\(testLat)&lng=\(testLng)")
    XCTAssertEqual(PoliceUKEndpoints.crimeByCustomLocation(lat: testLat,
                                                           lng: testLng,
                                                           crimeCategory: testCrimeCategory,
                                                           date: testDate),
                   "\(APIUrl)/crimes-street/\(testCrimeCategory)?lat=\(testLat)&lng=\(testLng)&date=\(testDate)")
    
    XCTAssertEqual(PoliceUKEndpoints.crimeByCustomLocation(crimeCategory: testCrimeCategory),
                   "\(APIUrl)/crimes-street/\(testCrimeCategory)")
    XCTAssertEqual(PoliceUKEndpoints.crimeByCustomLocation(crimeCategory: testCrimeCategory),
                   "\(APIUrl)/crimes-street/\(testCrimeCategory)")
  }
  
  func testCrimeDataAvailability() {
    XCTAssertEqual(PoliceUKEndpoints.crimeDataAvailability(), "\(APIUrl)/crimes-street-dates")
  }
  
  func testForcesList() {
    XCTAssertEqual(PoliceUKEndpoints.forcesList(), "\(APIUrl)/forces")
  }
  
  func testSpecificForce() {
    XCTAssertEqual(PoliceUKEndpoints.specificForce(force: testForce), "\(APIUrl)/forces/\(testForce)")
  }
  
  func testSeniorOfficers() {
    XCTAssertEqual(PoliceUKEndpoints.seniorOfficers(force: testForce), "\(APIUrl)/forces/\(testForce)/people")
  }
  
  func testNeighbourhoodPriorities() {
    XCTAssertEqual(PoliceUKEndpoints.neighbourhoodPriorities(force: testForce,
                                                             neighbourhood: testNeighbourhood),
                   "\(APIUrl)/\(testForce)/\(testNeighbourhood)/priorities")
  }
  
  func testNeighbourhoodListForForce() {
    XCTAssertEqual(PoliceUKEndpoints.neighbourhoodListForForce(force: testForce), "\(APIUrl)/\(testForce)/neighbourhoods")
  }
  
  func testNeighbourhoodTeam() {
    XCTAssertEqual(PoliceUKEndpoints.neighbourhoodTeam(force: testForce,
                                                       neighbourhood: testNeighbourhood),
                   "\(APIUrl)/\(testForce)/\(testNeighbourhood)/people")
  }
  
  func testNeighbourhoodDetails() {
    XCTAssertEqual(PoliceUKEndpoints.neighbourhoodDetails(force: testForce,
                                                          neighbourhood: testNeighbourhood),
                   "\(APIUrl)/\(testForce)/\(testNeighbourhood)")
  }
  
  func testNeighbourhoodBoundary() {
    XCTAssertEqual(PoliceUKEndpoints.neighbourhoodBoundary(force: testForce,
                                                           neighbourhood: testNeighbourhood),
                   "\(APIUrl)/\(testForce)/\(testNeighbourhood)/boundary")
  }
  
  func testLocateNeighbourhood() {
    XCTAssertEqual(PoliceUKEndpoints.locateNeighbourhood(lat: testLat,
                                                         lng: testLng),
                   "\(APIUrl)/locate-neighbourhood?q=\(testLat),\(testLng)")
  }
  
  func testStopAndSearchByForce() {
    XCTAssertEqual(PoliceUKEndpoints.stopAndSearchByForce(force: testForce,
                                                          date: nil),
                   "\(APIUrl)/stops-force?force=\(testForce)")
    XCTAssertEqual(PoliceUKEndpoints.stopAndSearchByForce(force: testForce,
                                                          date: testDate),
                   "\(APIUrl)/stops-force?force=\(testForce)&date=\(testDate)")
  }
  
  func testStopAndSearchByLocation() {
    XCTAssertEqual(PoliceUKEndpoints.stopAndSearchByLocation(locationID: testLocationID,
                                                             date: nil),
                   "\(APIUrl)/stops-at-location?location_id=\(testLocationID)")
    XCTAssertEqual(PoliceUKEndpoints.stopAndSearchByLocation(locationID: testLocationID,
                                                             date: testDate),
                   "\(APIUrl)/stops-at-location?location_id=\(testLocationID)&date=\(testDate)")
  }
  
  func testStopAndSearchByCustomLocation() {
    XCTAssertEqual(PoliceUKEndpoints.stopAndSearchByCustomLocation(lat: testLat,
                                                                   lng: testLng,
                                                                   date: nil),
                   "\(APIUrl)/stops-street?lat=\(testLat)&lng=\(testLng)")
    XCTAssertEqual(PoliceUKEndpoints.stopAndSearchByCustomLocation(lat: testLat,
                                                                   lng: testLng,
                                                                   date: testDate),
                   "\(APIUrl)/stops-street?lat=\(testLat)&lng=\(testLng)&date=\(testDate)")
    
    XCTAssertEqual(PoliceUKEndpoints.stopAndSearchByCustomLocation(poly: testPoly,
                                                                   date: nil),
                   "\(APIUrl)/stops-street?poly=\(testPoly.joined(separator: ":"))")
    XCTAssertEqual(PoliceUKEndpoints.stopAndSearchByCustomLocation(poly: testPoly,
                                                                   date: testDate),
                   "\(APIUrl)/stops-street?poly=\(testPoly.joined(separator: ":"))&date=\(testDate)")
  }
  
  func testStopAndSearchWithNoLocation() {
    XCTAssertEqual(PoliceUKEndpoints.stopAndSearchWithNoLocation(force: testForce,
                                                                 date: nil),
                   "\(APIUrl)/stops-force?force=\(testForce)")
    XCTAssertEqual(PoliceUKEndpoints.stopAndSearchWithNoLocation(force: testForce,
                                                                 date: testDate),
                   "\(APIUrl)/stops-force?force=\(testForce)&date=\(testDate)")
  }
}
