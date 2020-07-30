// Created by Deniss Kaibagarovs d.kaibagarov@gmail.com

import Foundation
import RxSwift
import RxCocoa
import Alamofire

class PoliceUKForcesListGateway {
  func getSingle(_ networking: Session) -> Single<[PoliceUKForceEntity]> {
    return Single.create { emitter in
      networking.request(PoliceUKEndpoints.forcesList())
        .responseDecodable(of: [PoliceUKForceEntity].self)
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

