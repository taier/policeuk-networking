// Created by Deniss Kaibagarovs d.kaibagarov@gmail.com

import Foundation
import RxSwift
import RxCocoa
import Alamofire

class PoliceUKCrimeByCustomLocationGateway {
  func getSingle(_ networking: Session,
                 forLatitude: String,
                 forLongitude: String,
                 forCrimeCategory: String,
                 forDate: String?) -> Single<[PoliceUKCrimeEntitiy]> {
    return Single.create { emitter in
      networking.request(PoliceUKEndpoints.crimeByCustomLocation(lat: forLatitude,
                                                                 lng: forLongitude,
                                                                 crimeCategory: forCrimeCategory,
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
                 forPoly: [String],
                 forCrimeCategory: String,
                 forDate: String?) -> Single<[PoliceUKCrimeEntitiy]> {
    return Single.create { emitter in
      networking.request(PoliceUKEndpoints.crimeByCustomLocation(poly: forPoly,
                                                                 crimeCategory: forCrimeCategory,
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
