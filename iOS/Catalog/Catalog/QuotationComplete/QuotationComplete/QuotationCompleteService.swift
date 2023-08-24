//
//  QuotationCompleteService.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/24.
//

import Foundation

protocol QuotationCompleteService {
  func powertrainId() -> Int
  func drivetrainId() -> Int
  func modelName() -> String
  func summary() -> SummaryCarQuotation
  func deleteSimilarOption(id: Int)
}

extension Quotation: QuotationCompleteService {
  func powertrainId() -> Int {
    state.quotation.powertrain.id
  }
  
  func drivetrainId() -> Int {
    state.quotation.drivetrain.id
  }
  
  func modelName() -> String {
    state.quotation.model.name
  }
  
  func summary() -> SummaryCarQuotation {
    state.quotation.toSummary()
  }
  
  func deleteSimilarOption(id: Int) {
    state.quotation.options = state.quotation.options.filter({$0.id != id})
  }
  
}
