//
//  SimilarQuotationService.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/24.
//

import Foundation

protocol SimilarQuotationService {
  
  var quotation: CarQuotation { get }
  
  var totalPrice: CLNumber { get }
  
  func addSimilarOption(options: [SimilarQuotationOption])
  
  var totalPriceInSimilarQuotation: Published<CLNumber>.Publisher { get }
  
}

extension Quotation: SimilarQuotationService {
  
  func addSimilarOption(options: [SimilarQuotationOption]) {
    quotation.options.append(contentsOf: Array(Set(options)))
    totalPrice = quotation.calculateTotalPrice()
  }
  
  var totalPriceInSimilarQuotation : Published<CLNumber>.Publisher {
    $totalPrice
  }

}
