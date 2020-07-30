// Created by Deniss Kaibagarovs d.kaibagarov@gmail.com

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
