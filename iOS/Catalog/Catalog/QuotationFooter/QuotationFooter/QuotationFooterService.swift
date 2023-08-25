//
//  QuotationFooterService.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/24.
//

import Foundation


protocol QuotationFooterService {
  
  func totalPrice() -> CLNumber
  
  func summaryQuotation() -> SummaryCarQuotation
  
  func quotationInQuotationFooter() -> CarQuotation
}

extension Quotation: QuotationFooterService {
  
  func totalPrice() -> CLNumber {
    state.totalPrice
  }
  
  func summaryQuotation() -> SummaryCarQuotation {
    state.quotation.toSummary()
  }
  
  func quotationInQuotationFooter() -> CarQuotation {
    state.quotation
  }

}
