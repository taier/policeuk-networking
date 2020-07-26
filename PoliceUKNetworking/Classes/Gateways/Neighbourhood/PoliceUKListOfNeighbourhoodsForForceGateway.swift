//
//  PoliceUKNeighbourhoodPrioritiesGateway.swift
//  PoliceUKNetworking
//
//  Created by Deniss Kaibagarovs on 26/07/2020.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire

class PoliceUKListOfNeighbourhoodsForForceGateway {
  func getSingle(_ networking: Session,
                 forForce: String) -> Single<[PoliceUKPoliceUKNeighbourhoodEntity]> {
    return Single.create { emitter in
      networking.request(PoliceUKEndpoints.neighbourhoodListForForce(force: forForce))
        .responseDecodable(of: [PoliceUKPoliceUKNeighbourhoodEntity].self)
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
