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

class PoliceUKNeighbourhoodTeamGateway {
  func getSingle(_ networking: Session,
                 forForce: String,
                 forNeighbourhood: String) -> Single<[PoliceUKNeighbourhoodTeamEntity]> {
    return Single.create { emitter in
      networking.request(PoliceUKEndpoints.neighbourhoodTeam(force: forForce, neighbourhood: forNeighbourhood))
        .responseDecodable(of: [PoliceUKNeighbourhoodTeamEntity].self)
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
