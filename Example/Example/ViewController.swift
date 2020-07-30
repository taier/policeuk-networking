//
//  ViewController.swift
//  Example
//
//  Created by Deniss Kaibagarovs on 25/07/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import PoliceUKNetworking

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    PoliceUKNetworking.getCrimeDBLaseUpdateDate { response, error in
      print("------------------ getCrimeDBLaseUpdateDate ------------------")
      print(response?.date)
    }
    
    PoliceUKNetworking.getCrimeCategories { response, error in
      print("------------------ getCrimeCategory ------------------")
      print(response)
    }
    
    PoliceUKNetworking.getForcesList { response, error in
      print("------------------ getForcesList ------------------")
      print(response)
    }
    
    PoliceUKNetworking.getSpecificForce(forForce: "leicestershire") { response, error in
      print("------------------ getSpecificForce ------------------")
      print(response)
    }
    
    PoliceUKNetworking.getSeniorOfficers(forForce: "leicestershire") { response, error in
      print("------------------ getSeniorOfficers ------------------")
      print(response)
    }
    
    PoliceUKNetworking.getCrimeOutcome(forCrime: "bd810be14c9d58eb4b19cd496e6c9f052b4e2df1e2b514c12921f6e8b49a5d73") { response, error in
      print("------------------ getCrimeOutcome ------------------")
      print(response)
      print(error)
    }
    
    PoliceUKNetworking.getNeighbourhoodPriorities(forForce: "city-of-london", forNeighbourhood: "cp") { response, error in
      print("------------------ getNeighbourhoodPriorities ------------------")
      print(response)
      print(error)
    }
    
    PoliceUKNetworking.getNeighbourhoods(forForce: "city-of-london") { response, error in
      print("------------------ getNeighbourhoods ------------------")
      print(response)
      print(error)
    }
    
    PoliceUKNetworking.getNeighbourhoodTeam(forForce: "city-of-london", forNeighbourhood: "cp") { response, error in
      print("------------------ getNeighbourhoodTeam ------------------")
      print(response)
      print(error)
    }
    
    PoliceUKNetworking.getNeighbourhoodDetails(forForce: "city-of-london", forNeighbourhood: "cp") { response, error in
      print("------------------ getNeighbourhoodDetails ------------------")
      print(response)
      print(error)
    }
    
    PoliceUKNetworking.getCrimesWithNoLocation(forCrimeCategory: "all-crime", forForce: "leicestershire") { response, error in
      print("------------------ getCrimesWithNoLocation ------------------")
      print(response)
      print(error)
    }
    
    PoliceUKNetworking.getCrimeDataAvailability { response, error in
      print("------------------ getCrimeDataAvailability ------------------")
      print(response)
      print(error)
    }
    
    PoliceUKNetworking.getStopAndSearchByForce(forForce: "city-of-london") { response, error in
      print("------------------ getStopAndSearchByForce ------------------")
      print(response)
      print(error)
    }
    
    PoliceUKNetworking.getStopAndSearchByLocation(forLocationID: "543585") { response, error in
      print("------------------ getStopAndSearchByLocation ------------------")
      print(response)
      print(error)
    }
    
    PoliceUKNetworking.getStopAndSearchWithNoLocation(forForce: "city-of-london") { response, error in
      print("------------------ getStopAndSearchWithNoLocation ------------------")
      print(response)
      print(error)
    }
    
    PoliceUKNetworking.getCrimesByLocation(forLocationID: "884227", forDate:"2017-10") { response, error in
      print("------------------ getCrimeByLocation ------------------")
      print(response)
      print(error)
    }
    
    PoliceUKNetworking.getCrimesByLocation(forLatitude:"52.629729", forLongitude: "-1.131592") { response, error in
      print("------------------ getCrimeByLocation ------------------")
      print(response)
      print(error)
    }
    
    PoliceUKNetworking.getNeighbourhoodByLocation(forLatitude:"52.629729", forLongitude: "-1.131592") { response, error in
      print("------------------ getNeighbourhoodByLocation ------------------")
      print(response)
      print(error)
    }
    
    PoliceUKNetworking.getNeighbourhoodBoundary(forForce: "city-of-london", forNeighbourhood: "cp") { response, error in
      print("------------------ getNeighbourhoodByLocation ------------------")
      print(response)
      print(error)
    }
    
    PoliceUKNetworking.getCrimesByCustomLocation(forLatitude: "52.629729",
                                                forLongitude: "-1.131592",
                                                forCrimeCategory: "burglary",
                                                forDate: "2020-01")
    { response, error in
      print("------------------ getCrimeByCustomLocation ------------------")
      print(response)
      print(error)
    }
    
    PoliceUKNetworking.getCrimesByCustomLocation(forPoly: ["52.268,0.543","52.794,0.238", "52.130,0.47"],
                                                forDate: "2020-01")
    { response, error in
      print("------------------ getCrimeByCustomLocation ------------------")
      print(response)
      print(error)
    }
    
    PoliceUKNetworking.getCrimeOutcomesByLocation(forLocationID: "883498",
                                                 forDate: "2020-05")
    { response, error in
      print("------------------ getCrimeOutcomeByLocation ------------------")
      print(response)
      print(error)
    }
    
    PoliceUKNetworking.getCrimeOutcomesByCustomLocation(forLatitude: "52.629729", forLongitude: "-1.131592", forDate: "2020-03") { response, error in
      print("------------------ getCrimeOutcomeByCustomLocation ------------------")
      print(response)
      print(error)
    }
    
    PoliceUKNetworking.getCrimeOutcomesByCustomLocation(forPoly: ["52.268,0.543","52.794,0.238", "52.130,0.47"], forDate: "2020-03") { response, error in
      print("------------------ getCrimeOutcomeByCustomLocation ------------------")
      print(response)
      print(error)
    }
    
    PoliceUKNetworking.getStopAndSearchByCustomLocation(forLatitude: "52.629729", forLongitude: "-1.131592", forDate: "2020-01") { response, error in
      print("------------------ getStopAndSearchByCustomLocation ------------------")
      print(response)
      print(error)
    }
    
    PoliceUKNetworking.getStopAndSearchByCustomLocation(forPoly: ["52.268,0.543","52.794,0.238", "52.130,0.47"]) { response, error in
      print("------------------ getStopAndSearchByCustomLocation ------------------")
      print(response)
      print(error)
    }
  }
}
