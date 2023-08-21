//
//  QuotationCompleteRequest.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/21.
//

import Foundation

enum QuotationCompleteRequest {
  case calculateFuelAndDisplacement(powertrainId: Int, drivetrainId: Int)
  case saveFinalQuotation(carQuotation: CarQuotation)
}

extension QuotationCompleteRequest: RequestProtocol {
  var host: String {
    return API.host
  }
  
  var path: String {
    switch self {
      case .calculateFuelAndDisplacement(let powertrainId, let drivetrainId):
        return "/technical-spec"
      case .saveFinalQuotation(_):
        return "/quotation"
    }
  }
  
  var headers: [String : String] {
    return [:]
  }
  
  var params: [String : Any] {
    switch self {
      case .saveFinalQuotation(let carQuotation):
        return
        ["carId": carQuotation.model.id,
         "trimId": carQuotation.trim.id,
         "modelTypeIds":
          ["powertrainId": carQuotation.powertrain.id,
           "bodytypeId": carQuotation.bodytype.id,
           "drivetrainId": carQuotation.drivetrain.id],
         "internalColorId": carQuotation.internalColor,
         "externalColorId": carQuotation.externalColor,
         "optionsIds": carQuotation.options.filter{ $0.isPackage == true }.map{ $0.id },
         "packageIds": carQuotation.options.filter{ $0.isPackage == false }.map{ $0.id }
        ]
      default:
        return [:]
    }
  }
  
  var urlParams: [String : String?] {
    switch self {
      case .calculateFuelAndDisplacement(let powertrainId, let drivetrainId):
        return ["drivetrainId":"\(drivetrainId)", "powertrainId": "\(powertrainId)"]
      default:
        return [:]
    }
  }
  
  var requestType: RequestType {
    switch self {
      case .calculateFuelAndDisplacement(_, _):
        return .GET
      case .saveFinalQuotation(_):
        return .POST
    }
  }
  
  var cachePolicy: URLRequest.CachePolicy {
    switch self {
      case .calculateFuelAndDisplacement(_ , _):
        return .returnCacheDataElseLoad
      default:
        return .useProtocolCachePolicy
    }
  }
  
  var secureType: SecureType {
    return .http
  }

}
