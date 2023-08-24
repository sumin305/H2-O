//
//  OptionSelectionService.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/24.
//

import Foundation

protocol OptionSelectionService {
  
  func updateOption(to option: some QuotationOptionable)
  
}

extension Quotation: OptionSelectionService {
  func updateOption(to option: some QuotationOptionable) {
    if state.quotation.options.contains(where: {$0.id == option.id}) {
      state.quotation.options.append(option)
    } else {
      state.quotation.options = state.quotation.options.filter {$0.id != option.id}
    }
  }
}
