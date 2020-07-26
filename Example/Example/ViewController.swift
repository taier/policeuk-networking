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
      print(response?.date)
    }
  }
}

