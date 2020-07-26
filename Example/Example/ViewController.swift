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
  }
}

