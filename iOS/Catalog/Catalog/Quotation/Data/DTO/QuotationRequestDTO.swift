//
//  QuotationRequestDTO.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/21.
//

import Foundation

struct ModelTypeIDRequestDTO: Encodable {
  var bodyTypeId: Int
  var drivetrainId: Int
  var powertrainId: Int
}

struct QuotationRequestDTO: Encodable {
  var carId: Int
  var modelTypeIds: ModelTypeIDRequestDTO
  var internalColorId: Int
  var externalColorId: Int
  var optionIds: [Int]
  var packageIds: [Int]
  var trimId: Int
}

