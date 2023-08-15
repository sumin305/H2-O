//
//  CarQuotation.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/09.
//

import Foundation
import UIKit

struct SummaryQuotationInfo {
  var name: String
  var price: CLNumber
}

struct SummaryCarQuotation {
  var externalImage: URL
  var internalImage: URL
  var model: SummaryQuotationInfo
  var trim: SummaryQuotationInfo
  var powertrain: SummaryQuotationInfo
  var bodyType: SummaryQuotationInfo
  var drivetrain: SummaryQuotationInfo
  var externalColor: SummaryQuotationInfo
  var internalColor: SummaryQuotationInfo
  var options: [SummaryQuotationInfo]
}

struct CarQuotationType {
  let name: String
  let price: Int
  let description: String
  let image: String
}
struct CarQuotation {
    var model: SummaryQuotationInfo = SummaryQuotationInfo(name: "팰리세이드", price: CLNumber(3880000))
    var trim: Trim
    var modelType: ModelTypeModel
    var externalColor: ExternalColorModel
    var internalColor: InternalColorModel
    var options: [OptionModel]

  func toSummary() -> SummaryCarQuotation {
    return SummaryCarQuotation(externalImage: externalColor.image,
                        internalImage: internalColor.images.first!,
                        model: SummaryQuotationInfo(name: model.name, price: model.price),
                        trim: SummaryQuotationInfo(name: trim.name, price: trim.price),
                        powertrain: SummaryQuotationInfo(name: powertrain.name, price: powertrain.price),
                        bodyType: SummaryQuotationInfo(name: bodyType.name, price: bodyType.price),
                        drivetrain: SummaryQuotationInfo(name: drivetrain.name, price: drivetrain.price),
                        externalColor: SummaryQuotationInfo(name: externalColor.name, price: externalColor.price),
                        internalColor: SummaryQuotationInfo(name: internalColor.name, price: internalColor.price),
                        options: options.map {SummaryQuotationInfo(name: $0.name, price: $0.price)})
  }
}
