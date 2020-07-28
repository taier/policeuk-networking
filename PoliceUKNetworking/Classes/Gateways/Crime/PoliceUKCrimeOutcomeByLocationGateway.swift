//
//  PoliceUKCrimeOutcomeByLocationGateway.swift
//  PoliceUKNetworking
//
//  Created by Deniss Kaibagarovs on 28/07/2020.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire

class PoliceUKCrimeOutcomeByLocationGateway {
  func getSingle(_ networking: Session,
                 forLocationID: String,
                 forDate: String?) -> Single<[PoliceUKCrimeOutcome]> {
    return Single.create { emitter in
      networking.request(PoliceUKEndpoints.crimeOutcomeByLocation(locationID: forLocationID,
                                                                  date: forDate))
        .responseDecodable(of: [PoliceUKCrimeOutcome].self)
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
