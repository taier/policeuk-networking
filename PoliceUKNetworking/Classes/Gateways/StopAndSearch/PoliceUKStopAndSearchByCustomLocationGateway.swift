//
//  PoliceUKStopAndSearchByCustomLocationGateway.swift
//  PoliceUKNetworking
//
//  Created by Deniss Kaibagarovs on 28/07/2020.
//

import Foundation

import Foundation
import RxSwift
import RxCocoa
import Alamofire

class PoliceUKStopAndSearchByCustomLocationGateway {
  func getSingle(_ networking: Session,
                 forLatitude: String,
                 forLongitude: String,
                 forDate: String?) -> Single<[PoliceUKStopAndSearchEntity]> {
    return Single.create { emitter in
      networking.request(PoliceUKEndpoints.stopAndSearchByCustomLocation(lat: forLatitude,
                                                                         lng: forLongitude,
                                                                         date: forDate))
        .responseDecodable(of: [PoliceUKStopAndSearchEntity].self)
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
                 forPoly: [String],
                 forDate: String?) -> Single<[PoliceUKStopAndSearchEntity]> {
    return Single.create { emitter in
      networking.request(PoliceUKEndpoints.stopAndSearchByCustomLocation(poly: forPoly,
                                                                         date: forDate))
        .responseDecodable(of: [PoliceUKStopAndSearchEntity].self)
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
