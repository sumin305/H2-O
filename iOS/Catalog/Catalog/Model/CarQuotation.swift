//
//  CarQuotation.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/09.
//

import Foundation
import UIKit

struct CarModel {
  var name: String
  var price: CLNumber
}

struct SummaryCarQuotation {
  var externalImage: URL
  var internalImage: URL
  var model: (name: String, price: CLNumber)
  var trim: (name: String, price: CLNumber)
  var powertrain: (name: String, price: CLNumber)
  var bodyType: (name: String, price: CLNumber)
  var drivetrain: (name: String, price: CLNumber)
  var externalColor: (name: String, price: CLNumber)
  var internalColor: (name: String, price: CLNumber)
  var options: [(name: String, price: CLNumber)]
}

struct CarQuotation {
    var model: CarModel = CarModel(name: "팰리세이드", price: CLNumber(3880000))
    var trim: Trim
    var powertrain: Powertrain
    var bodyType: BodyType
    var drivetrain: Drivetrain
    var externalColor: ExternalColor
    var internalColor: InternalColor
    var options: [Option]

  func toSummary() -> SummaryCarQuotation {
    return SummaryCarQuotation(externalImage: externalColor.images.first!,
                        internalImage: internalColor.images.first!,
                        model: (name: model.name, price: model.price),
                        trim: (name: trim.name, price: trim.price),
                        powertrain: (name: powertrain.name, price: powertrain.price),
                        bodyType: (name: bodyType.name, price: bodyType.price),
                        drivetrain: (name: drivetrain.name, price: drivetrain.price),
                        externalColor: (name: externalColor.name, price: externalColor.price),
                        internalColor: (name: internalColor.name, price: internalColor.price),
                        options: options.map {(name: $0.name, price: $0.price)})
  }
}
