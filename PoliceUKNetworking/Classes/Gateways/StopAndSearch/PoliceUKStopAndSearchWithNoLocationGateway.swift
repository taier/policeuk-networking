// Created by Deniss Kaibagarovs d.kaibagarov@gmail.com


import Foundation
import RxSwift
import RxCocoa
import Alamofire

class PoliceUKStopAndSearchWithNoLocationGateway {
  func getSingle(_ networking: Session,
                 forForce: String,
                 forDate: String?) -> Single<[PoliceUKStopAndSearchEntity]> {
    return Single.create { emitter in
      networking.request(PoliceUKEndpoints.stopAndSearchWithNoLocation(force: forForce, date: forDate))
        .responseDecodable(of: [PoliceUKStopAndSearchEntity].self)
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
