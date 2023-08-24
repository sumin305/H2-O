//
//  SimilarQuotationService.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/24.
//

import Foundation

protocol SimilarQuotationService {
  
  func quotation() -> CarQuotation
  
  func addSimilarOption(options: [any QuotationOptionable])
  
  func totalPrice() -> CLNumber
}

extension Quotation: SimilarQuotationService {
  func quotation() -> CarQuotation {
    state.quotation
  }
  
  func addSimilarOption(options: [any QuotationOptionable]) {
    state.quotation.options.append(contentsOf: options)
  }

}
