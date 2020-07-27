//
//  PoliceUKCrimesWithNoLocationGateway.swift
//  PoliceUKNetworking
//
//  Created by Deniss Kaibagarovs on 27/07/2020.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire

class PoliceUKCrimesWithNoLocationGateway {
  func getSingle(_ networking: Session,
                 forCrimeCategory: String,
                 forForce: String,
                 forDate: String?) -> Single<[PoliceUKCrimeEntitiy]> {
    return Single.create { emitter in
      networking.request(PoliceUKEndpoints.crimesWithNoLocation(
        crimeCategory: forCrimeCategory,
        force: forForce,
        date: forDate))
        .responseDecodable(of: [PoliceUKCrimeEntitiy].self)
        { response in
          if let entity = response.value {
            emitter(.success(entity))
          } else if let error = response.error {
            emitter(.error(error))
          }
      }
      return Disposables.create {}
    }
  }
}
