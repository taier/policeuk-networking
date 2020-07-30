// Created by Deniss Kaibagarovs d.kaibagarov@gmail.com

import Foundation

import Foundation
import RxSwift
import RxCocoa
import Alamofire

class PoliceUKSeniorOfficersGateway {
  func getSingle(_ networking: Session, forForce: String) -> Single<[PoliceUKSeniorOfficerEntity]> {
    return Single.create { emitter in
      networking.request(PoliceUKEndpoints.seniorOfficers(force: forForce))
        .responseDecodable(of: [PoliceUKSeniorOfficerEntity].self)
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
