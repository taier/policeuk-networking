//
//  PoliceUKLocateNeighbourhoodGateway.swift
//  PoliceUKNetworking
//
//  Created by Deniss Kaibagarovs on 27/07/2020.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire

class PoliceUKLocateNeighbourhoodGateway {
  func getSingle(_ networking: Session,
                 forLatitude: String,
                 forLongitude: String) -> Single<PoliceUKLocateNeighbourhoodEntity> {
    return Single.create { emitter in
      networking.request(PoliceUKEndpoints.locateNeighbourhood(lat: forLatitude,
                                                               lng: forLongitude))
        .responseDecodable(of: PoliceUKLocateNeighbourhoodEntity.self)
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

