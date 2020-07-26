//
//  PoliceUKCrimeCategoriesGateway.swift
//  PoliceUKNetworking
//
//  Created by Deniss Kaibagarovs on 26/07/2020.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire

class PoliceUKCrimeCategoriesGateway {
  func getSingle(_ networking: Session, forDate: String?) -> Single<[PoliceUKCrimeCategoryEntity]> {
    return Single.create { emitter in
      networking.request(PoliceUKEndpoints.crimeCategories(date: forDate))
        .responseDecodable(of: [PoliceUKCrimeCategoryEntity].self)
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
