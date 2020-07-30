// Created by Deniss Kaibagarovs d.kaibagarov@gmail.com

import Foundation
import RxSwift
import RxCocoa
import Alamofire

class PoliceUKNeighbourhoodPrioritiesGateway {
  func getSingle(_ networking: Session,
                 forForce: String,
                 forNeighbourhood: String) -> Single<[PoliceUKNeighbourhoodPrioritiesEntity]> {
    return Single.create { emitter in
      networking.request(PoliceUKEndpoints.neighbourhoodPriorities(force: forForce, neighbourhood: forNeighbourhood))
        .responseDecodable(of: [PoliceUKNeighbourhoodPrioritiesEntity].self)
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
