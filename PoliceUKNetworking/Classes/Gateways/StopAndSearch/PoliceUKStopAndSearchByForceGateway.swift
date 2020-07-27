//
//  PoliceUKStopAndSearchByForceGateway.swift
//  PoliceUKNetworking
//
//  Created by Deniss Kaibagarovs on 27/07/2020.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire

class PoliceUKStopAndSearchByForceGateway {
  func getSingle(_ networking: Session,
                 forForce: String,
                 forDate: String?) -> Single<[PoliceUKStopAndSearchEntity]> {
    return Single.create { emitter in
      networking.request(PoliceUKEndpoints.stopAndSearchByForce(force: forForce, date: forDate))
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
