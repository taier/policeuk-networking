//  Created by Deniss Kaibagarovs d.kaibagarov@gmail.com

import UIKit
import PoliceUKNetworking

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
/* *********** Uncomment to test run a needed method *********** */
      /* ------- Crime ------- */
//    getCrimeDBLaseUpdateDate()
//    getCrimeDataAvailability()
//    getCrimeCategories()
//    getCrimesWithNoLocation()
//    getCrimesByLocation()
//    getCrimesByLocationForLatLong()
//    getCrimesByCustomLocationForLatLong()
//    getCrimesByCustomLocationForPoly()
      /* ------- Force ------- */
//    getForcesList()
//    getSpecificForce()
//    getSeniorOfficers()
      /* ------- Crime Outcome ------- */
//    getCrimeOutcome()
//    getCrimeOutcomesByLocation()
//    getCrimeOutcomesByCustomLocationForLatLong()
//    getCrimeOutcomesByCustomLocatioForPoly()
      /* ------- Neighbourhood ------- */
//    getNeighbourhoods()
//    getNeighbourhoodTeam()
//    getNeighbourhoodDetails()
//    getNeighbourhoodPriorities()
//    getNeighbourhoodByLocation()
//    getNeighbourhoodBoundary()
      /* ------- Stop and Search ------- */
//    getStopAndSearchByForce()
//    getStopAndSearchWithNoLocation()
//    getStopAndSearchByLocation()
//    getStopAndSearchByCustomLocationForLatLong()
//    getStopAndSearchByCustomLocationForPoly()
  }
  
  //MARK: - Crime
  
  func getCrimeDBLaseUpdateDate() {
    PoliceUKNetworking.getCrimeDBLaseUpdateDate { response, error in
      print("------------------ getCrimeDBLaseUpdateDate ------------------")
      if let response = response {
        print("response: \(response)")
      }
      if let error = error {
        print("error: \(error)")
      }
    }
  }
  
  func getCrimeCategories() {
    PoliceUKNetworking.getCrimeCategories { response, error in
      print("------------------ getCrimeCategory ------------------")
      if let response = response {
        print("response: \(response)")
      }
      if let error = error {
        print("error: \(error)")
      }
    }
  }
  
  func getCrimesWithNoLocation() {
    PoliceUKNetworking.getCrimesWithNoLocation(forCrimeCategory: "all-crime", forForce: "leicestershire") { response, error in
      print("------------------ getCrimesWithNoLocation ------------------")
      if let response = response {
        print("response: \(response)")
      }
      if let error = error {
        print("error: \(error)")
      }
    }
  }
  
  func getCrimeDataAvailability() {
    PoliceUKNetworking.getCrimeDataAvailability { response, error in
      print("------------------ getCrimeDataAvailability ------------------")
      if let response = response {
        print("response: \(response)")
      }
      if let error = error {
        print("error: \(error)")
      }
    }
  }
  
  func getCrimesByLocationForLatLong() {
    PoliceUKNetworking.getCrimesByLocation(forLatitude:"52.629729", forLongitude: "-1.131592") { response, error in
      print("------------------ getCrimesByLocation for Lat/Long ------------------")
      if let response = response {
        print("response: \(response)")
      }
      if let error = error {
        print("error: \(error)")
      }
    }
  }
  
  func getCrimesByCustomLocationForLatLong() {
    PoliceUKNetworking.getCrimesByCustomLocation(forLatitude: "52.629729",
                                                 forLongitude: "-1.131592",
                                                 forCrimeCategory: "burglary",
                                                 forDate: "2020-01")
    { response, error in
      print("------------------ getCrimesByCustomLocation for Lat/Long ------------------")
      if let response = response {
        print("response: \(response)")
      }
      if let error = error {
        print("error: \(error)")
      }
    }
  }
  
  func getCrimesByCustomLocationForPoly() {
    PoliceUKNetworking.getCrimesByCustomLocation(forPoly: ["52.268,0.543","52.794,0.238", "52.130,0.47"], forDate: "2020-01") { response, error in
      print("------------------ getCrimesByCustomLocation for Poly ------------------")
      if let response = response {
        print("response: \(response)")
      }
      if let error = error {
        print("error: \(error)")
      }
    }
  }
  
  
  func getCrimesByLocation() {
    PoliceUKNetworking.getCrimesByLocation(forLocationID: "884227", forDate:"2020-05") { response, error in
      print("------------------ getCrimeByLocation ------------------")
      if let response = response {
        print("response: \(response)")
      }
      if let error = error {
        print("error: \(error)")
      }
    }
  }
  
  //MARK: - Force
  
  func getForcesList() {
    PoliceUKNetworking.getForcesList { response, error in
      print("------------------ getForcesList ------------------")
      if let response = response {
        print("response: \(response)")
      }
      if let error = error {
        print("error: \(error)")
      }
    }
  }
  
  func getSpecificForce() {
    PoliceUKNetworking.getSpecificForce(forForce: "leicestershire") { response, error in
      print("------------------ getSpecificForce ------------------")
      if let response = response {
        print("response: \(response)")
      }
      if let error = error {
        print("error: \(error)")
      }
    }
  }
  
  func getSeniorOfficers() {
    PoliceUKNetworking.getSeniorOfficers(forForce: "leicestershire") { response, error in
      print("------------------ getSeniorOfficers ------------------")
      if let response = response {
        print("response: \(response)")
      }
      if let error = error {
        print("error: \(error)")
      }
    }
  }
  
  //MARK: - Crime Outcome
  
  func getCrimeOutcomesByLocation() {
    PoliceUKNetworking.getCrimeOutcomesByLocation(forLocationID: "883498", forDate: "2020-05") { response, error in
      print("------------------ getCrimeOutcomesByLocation ------------------")
      if let response = response {
        print("response: \(response)")
      }
      if let error = error {
        print("error: \(error)")
      }
    }
  }
  
  func getCrimeOutcome() {
    PoliceUKNetworking.getCrimeOutcome(forCrimeID: "bd810be14c9d58eb4b19cd496e6c9f052b4e2df1e2b514c12921f6e8b49a5d73") { response, error in
      print("------------------ getCrimeOutcome ------------------")
      if let response = response {
        print("response: \(response)")
      }
      if let error = error {
        print("error: \(error)")
      }
    }
  }
  
  func getCrimeOutcomesByCustomLocationForLatLong() {
    PoliceUKNetworking.getCrimeOutcomesByCustomLocation(forLatitude: "52.629729", forLongitude: "-1.131592", forDate: "2020-03") { response, error in
      print("------------------ getCrimeOutcomesByCustomLocation for Lat/Long ------------------")
      if let response = response {
        print("response: \(response)")
      }
      if let error = error {
        print("error: \(error)")
      }
    }
  }
  
  func getCrimeOutcomesByCustomLocatioForPoly() {
    PoliceUKNetworking.getCrimeOutcomesByCustomLocation(forPoly: ["52.268,0.543","52.794,0.238", "52.130,0.47"], forDate: "2020-03") { response, error in
      print("------------------ getCrimeOutcomeByCustomLocation for Poly ------------------")
      if let response = response {
        print("response: \(response)")
      }
      if let error = error {
        print("error: \(error)")
      }
    }
  }
  
  //MARK: - Neighbourhood
  
  func getNeighbourhoodPriorities() {
    PoliceUKNetworking.getNeighbourhoodPriorities(forForce: "city-of-london", forNeighbourhood: "cp") { response, error in
      print("------------------ getNeighbourhoodPriorities ------------------")
      if let response = response {
        print("response: \(response)")
      }
      if let error = error {
        print("error: \(error)")
      }
    }
  }
  
  func getNeighbourhoods() {
    PoliceUKNetworking.getNeighbourhoods(forForce: "city-of-london") { response, error in
      print("------------------ getNeighbourhoods ------------------")
      if let response = response {
        print("response: \(response)")
      }
      if let error = error {
        print("error: \(error)")
      }
    }
  }
  
  func getNeighbourhoodTeam() {
    PoliceUKNetworking.getNeighbourhoodTeam(forForce: "city-of-london", forNeighbourhood: "cp") { response, error in
      print("------------------ getNeighbourhoodTeam ------------------")
      if let response = response {
        print("response: \(response)")
      }
      if let error = error {
        print("error: \(error)")
      }
    }
  }
  
  func getNeighbourhoodDetails() {
    PoliceUKNetworking.getNeighbourhoodDetails(forForce: "city-of-london", forNeighbourhood: "cp") { response, error in
      print("------------------ getNeighbourhoodDetails ------------------")
      if let response = response {
        print("response: \(response)")
      }
      if let error = error {
        print("error: \(error)")
      }
    }
  }
  
  func getNeighbourhoodByLocation() {
    PoliceUKNetworking.getNeighbourhoodByLocation(forLatitude:"52.629729", forLongitude: "-1.131592") { response, error in
      print("------------------ getNeighbourhoodByLocation ------------------")
      if let response = response {
        print("response: \(response)")
      }
      if let error = error {
        print("error: \(error)")
      }
    }
  }
  
  func getNeighbourhoodBoundary() {
    PoliceUKNetworking.getNeighbourhoodBoundary(forForce: "city-of-london", forNeighbourhood: "cp") { response, error in
      print("------------------ getNeighbourhoodBoundary ------------------")
      if let response = response {
        print("response: \(response)")
      }
      if let error = error {
        print("error: \(error)")
      }
    }
  }
  
  //MARK: - Stop and Search
  
  func getStopAndSearchByForce() {
    PoliceUKNetworking.getStopAndSearchByForce(forForce: "city-of-london") { response, error in
      print("------------------ getStopAndSearchByForce ------------------")
      if let response = response {
        print("response: \(response)")
      }
      if let error = error {
        print("error: \(error)")
      }
    }
  }
  
  func getStopAndSearchByLocation() {
    PoliceUKNetworking.getStopAndSearchByLocation(forLocationID: "543585") { response, error in
      print("------------------ getStopAndSearchByLocation ------------------")
      if let response = response {
        print("response: \(response)")
      }
      if let error = error {
        print("error: \(error)")
      }
    }
  }
  
  func getStopAndSearchWithNoLocation() {
    PoliceUKNetworking.getStopAndSearchWithNoLocation(forForce: "city-of-london") { response, error in
      print("------------------ getStopAndSearchWithNoLocation ------------------")
      if let response = response {
        print("response: \(response)")
      }
      if let error = error {
        print("error: \(error)")
      }
    }
  }
  
  func getStopAndSearchByCustomLocationForLatLong() {
    PoliceUKNetworking.getStopAndSearchByCustomLocation(forLatitude: "52.629729", forLongitude: "-1.131592", forDate: "2020-01") { response, error in
      print("------------------ getStopAndSearchByCustomLocation for Lat/Long ------------------")
      if let response = response {
        print("response: \(response)")
      }
      if let error = error {
        print("error: \(error)")
      }
    }
  }
  
  func getStopAndSearchByCustomLocationForPoly() {
    PoliceUKNetworking.getStopAndSearchByCustomLocation(forPoly: ["52.268,0.543","52.794,0.238", "52.130,0.47"]) { response, error in
      print("------------------ getStopAndSearchByCustomLocation for Poly ------------------")
      if let response = response {
        print("response: \(response)")
      }
      if let error = error {
        print("error: \(error)")
      }
    }
  }
}
