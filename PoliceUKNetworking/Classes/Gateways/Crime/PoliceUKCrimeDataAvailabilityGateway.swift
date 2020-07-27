//
//  PoliceUKCrimeDateAvailabilityGateway.swift
//  PoliceUKNetworking
//
//  Created by Deniss Kaibagarovs on 27/07/2020.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire

class PoliceUKCrimeDataAvailabilityGateway {
  func getSingle(_ networking: Session) -> Single<[PoliceUKCrimeDataAvailabilityEntity]> {
    return Single.create { emitter in
      networking.request(PoliceUKEndpoints.crimeDataAvailability())
        .responseDecodable(of: [PoliceUKCrimeDataAvailabilityEntity].self)
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
