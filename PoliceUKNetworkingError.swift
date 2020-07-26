//
//  PoliceUKNetworkingError.swift
//  PoliceUKNetworking
//
//  Created by Deniss Kaibagarovs on 26/07/2020.
//

import Foundation

public enum PoliceUKNetworkingError: Error {
    case responseIsNull
    case internalObjectParsingFailed
    case unknownError
}
