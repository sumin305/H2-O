//
//  QuotationModel.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/16.
//

import Foundation

enum QuotationModel {

  struct State {
    var totalPrice: CLNumber
    var itemList: CarQuotation?
  }

  enum ViewAction {
    case isTrimSelected(carQuotation: CarQuotation)
    case isDetailChanged
    case isPriceChanged(price: CLNumber)
  }
}

