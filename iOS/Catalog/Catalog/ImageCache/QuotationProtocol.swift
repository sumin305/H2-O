//
//  QuotationProtocol.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/23.
//

import Foundation
import Combine








protocol QuotationCompleteService {
  func powertrainId() -> Int
  func privetrainId() -> Int
  func modelName() -> String
  func Summary() -> SummaryCarQuotation
  func deleteSimilarOption(id: Int)
}

protocol SimilarQuotationService {
  
  func quotation() -> CarQuotation
  
  func addSimilarOption(option: [any QuotationOptionable])
  
}

protocol QuotationFooterService {
  
  func totalPrice() -> CLNumber
  
  func summaryQuotation() -> SummaryCarQuotation
  
}
