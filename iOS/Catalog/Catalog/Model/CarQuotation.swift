//
//  CarQuotation.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/09.
//

import Foundation

struct CarQuotation {
    var externalImage: String
    var internalImage: String
    var model: (name: String, price: CLPrice)
    var trim: (name: String, price: CLPrice)
    var powertrain: (name: String, price: CLPrice)
    var bodyType: (name: String, price: CLPrice)
    var drivingMethod: (name: String, price: CLPrice)
    var externalColor: (name: String, price: CLPrice)
    var internalColor: (name: String, price: CLPrice)
    var options: [(name: String, price: CLPrice)]

  static func mockQuotation() -> CarQuotation {
    CarQuotation(externalImage: "external_image",
                 internalImage: "internal_image",
                 model: (name: "팰리세이드", price: CLPrice(3880000)),
                 trim: (name: "Le Blanc (르블랑)", price: CLPrice(0)),
                 powertrain: (name: "디젤 2.2", price: CLPrice(280000)),
                 bodyType: (name: "7인승", price: CLPrice(0)),
                 drivingMethod: (name: "2WD", price: CLPrice(0)),
                 externalColor: (name: "어비스 블랙펄", price: CLPrice(150000)),
                 internalColor: (name: "어비스 블랙펄", price: CLPrice(0)),
                 options: [(name: "-", price: CLPrice(0)),
                           (name: "-", price: CLPrice(0)),
                           (name: "-", price: CLPrice(0)),
                           (name: "-", price: CLPrice(0))]
    )
  }
}
