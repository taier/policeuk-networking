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
    
    PoliceUKNetworking.getCrimeCategory { response, error in
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
    
    PoliceUKNetworking.getStopAndSearch(forForce: "city-of-london") { response, error in
      print("------------------ getCrimeDataAvailability ------------------")
      print(response)
      print(error)
    }
  }
}
