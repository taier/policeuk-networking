//
//  PoliceUKCrimeByLocationGateway.swift
//  PoliceUKNetworking
//
//  Created by Deniss Kaibagarovs on 27/07/2020.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire
 
class PoliceUKCrimeByLocationGateway {
  func getSingle(_ networking: Session,
                 forLocationID: String,
                 forDate: String?) -> Single<[PoliceUKCrimeEntitiy]> {
    return Single.create { emitter in
      networking.request(PoliceUKEndpoints.crimeByLocation(locationID: forLocationID,
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
  
  func getSingle(_ networking: Session,
                 forLatitude: String,
                 forLongitude: String,
                 forDate: String?) -> Single<[PoliceUKCrimeEntitiy]> {
    return Single.create { emitter in
      networking.request(PoliceUKEndpoints.crimeByLocation(lat: forLatitude,
                                                           lng: forLongitude,
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
