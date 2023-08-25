//
//  CLBudgetPriceService.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/24.
//

import Foundation

protocol CLBudgetPriceService {
  func totalPriceInBudgetPrice() -> CLNumber
  func minPrice() -> CLNumber
  func maxPrice() -> CLNumber
}

extension Quotation: CLBudgetPriceService {
  func totalPriceInBudgetPrice() -> CLNumber {
    state.totalPrice
  }
  func minPrice() -> CLNumber {
    state.minPrice
  }
  func maxPrice() -> CLNumber {
    state.maxPrice
  }
}
