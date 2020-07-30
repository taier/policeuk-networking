//
//  PoliceUKCrimeOutcomeByCustomLocationGateway.swift
//  PoliceUKNetworking
//
//  Created by Deniss Kaibagarovs on 28/07/2020.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire

class PoliceUKCrimeOutcomeByCustomLocationGateway {
  func getSingle(_ networking: Session,
                 forLatitude: String,
                 forLongitude: String,
                 forDate: String?) -> Single<[PoliceUKCrimeOutcomeEntity]> {
    return Single.create { emitter in
      networking.request(PoliceUKEndpoints.crimeOutcomeByCustomLocation(lat: forLatitude,
                                                                        lng: forLongitude,
                                                                        date: forDate))
        .responseDecodable(of: [PoliceUKCrimeOutcomeEntity].self)
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
                 forDate: String?) -> Single<[PoliceUKCrimeOutcomeEntity]> {
    return Single.create { emitter in
      networking.request(PoliceUKEndpoints.crimeOutcomeByCustomLocation(poly: forPoly,
                                                                        date: forDate))
        .responseDecodable(of: [PoliceUKCrimeOutcomeEntity].self)
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

