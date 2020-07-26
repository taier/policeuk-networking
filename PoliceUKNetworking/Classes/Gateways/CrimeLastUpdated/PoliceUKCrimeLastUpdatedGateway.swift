//
//  PoliceUKCrimeLastUpdatedGateway.swift
//  PoliceUKNetworking
//
//  Created by Deniss Kaibagarovs on 25/07/2020.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire

class PoliceUKCrimeLastUpdatedGateway {
  func getSingle() -> Single<PoliceUKCrimeLastUpdatedEntity> {
    return Single<PoliceUKCrimeLastUpdatedEntity>.create { emitter in
      AF.request(PoliceUKEndpoints.crimeLastUpdated())
        .responseDecodable(of: PoliceUKCrimeLastUpdatedEntity.self)
        { response in
        if let entity = response.value {
          emitter(.success(entity))
        } else {
          emitter(.error(PoliceUKNetworkingError.unknownError))
        }
      }
      return Disposables.create {}
    }
  }
}
