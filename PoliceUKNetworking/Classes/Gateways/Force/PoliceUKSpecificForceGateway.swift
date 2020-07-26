//
//  PoliceUKSpecificForceGateway.swift
//  PoliceUKNetworking
//
//  Created by Deniss Kaibagarovs on 26/07/2020.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire

class PoliceUKSpecificForceGateway {
  func getSingle(_ networking: Session, forForce: String) -> Single<PoliceUKSpecificForceEntity> {
    return Single.create { emitter in
      networking.request(PoliceUKEndpoints.specificForce(force: forForce))
        .responseDecodable(of: PoliceUKSpecificForceEntity.self)
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
