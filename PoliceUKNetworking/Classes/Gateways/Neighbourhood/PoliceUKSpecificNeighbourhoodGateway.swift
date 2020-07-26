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

class PoliceUKSpecificNeighbourhoodGateway {
  func getSingle(_ networking: Session,
                 forForce: String,
                 forNeighbourhood: String) -> Single<PoliceUKNeighbourhoodDetailsEntity> {
    return Single.create { emitter in
      networking.request(PoliceUKEndpoints.neighbourhoodDetails(force: forForce, neighbourhood: forNeighbourhood))
        .responseDecodable(of: PoliceUKNeighbourhoodDetailsEntity.self)
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
