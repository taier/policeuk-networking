// Created by Deniss Kaibagarovs d.kaibagarov@gmail.com

import Foundation
import RxSwift
import RxCocoa
import Alamofire

class PoliceUKCrimeLastUpdatedGateway {
  func getSingle(_ networking: Session) -> Single<PoliceUKCrimeLastUpdatedEntity> {
    return Single.create { emitter in
      networking.request(PoliceUKEndpoints.crimeLastUpdated())
        .responseDecodable(of: PoliceUKCrimeLastUpdatedEntity.self)
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
