//
//  TrimSelectionRequest.swift
//  Catalog
//
//  Created by Jung peter on 8/9/23.
//

import Foundation

enum TrimSelectionRequest {
  case fetchTrimList(vehicleId: Int)
  case fetchDefaultOption(trimId: Int)
}

extension TrimSelectionRequest: RequestProtocol {

  var host: String {
    return API.host
  }

  var path: String {
    switch self {
    case .fetchTrimList(let vehicleId):
      return "/vehicle/\(vehicleId)"
    case .fetchDefaultOption(let trimId):
      return "/trim/\(trimId)/default-options"
    }
  }

  var headers: [String: String] {
    switch self {
    default:
      return [:]
    }
  }

  var params: [String: Any] {
    switch self {
    default:
      return [:]
    }
  }

  var requestType: RequestType {
    switch self {
    case .fetchTrimList:
      return .GET
    case .fetchDefaultOption:
      return .GET
    }
  }

  var cachePolicy: URLRequest.CachePolicy {
    return .returnCacheDataElseLoad
  }

  var timeOutInterval: TimeInterval {
    return 2
  }

  var urlParams: [String: String?] {
    return [:]
  }

  var secureType: SecureType {
    return .https
  }

}
