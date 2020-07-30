// Created by Deniss Kaibagarovs d.kaibagarov@gmail.com

import Foundation
import RxSwift
import RxCocoa
import Alamofire

class PoliceUKCimeOutcomeGateway {
  func getSingle(_ networking: Session, forCrime: String) -> Single<PoliceUKCrimeOutcomeRootEntity> {
    return Single.create { emitter in
      networking.request(PoliceUKEndpoints.crimeOutcome(crime: forCrime))
        .responseDecodable(of: PoliceUKCrimeOutcomeRootEntity.self)
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
