//
//  QuotationFooterIntent.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/24.
//

import Foundation
import Combine

protocol QuotationFooterIntentType {
  
  var state: QuotationFooterModel.State { get }
  
  func send(action: QuotationFooterModel.ViewAction)
  
  func send(action: QuotationFooterModel.ViewAction, viewEffect: (() -> Void)?)
  
}

final class QuotationFooterIntent: ObservableObject {
  
  init(initialState: State, quotation: QuotationFooterService) {
    state = initialState
    self.quotation = quotation
  }
  
  typealias State = QuotationFooterModel.State
  typealias ViewAction = QuotationFooterModel.ViewAction
  
  @Published var state: State = .init(totalPrice: CLNumber(0), summary: SummaryCarQuotation.mock())
  
  var cancellable: Set<AnyCancellable> = []
  
  private var repostitory: QuotationRepositoryProtocol
  private var quotation: QuotationFooterService
}

extension QuotationFooterIntent: QuotationFooterIntentType, IntentType {
  func mutate(action: QuotationFooterModel.ViewAction, viewEffect: (() -> Void)?) {
    switch action {
      case .priceChanged(let price):
        state.totalPrice = quotation.totalPrice()
      case .summaryChanged:
        state.summary = quotation.summaryQuotation()
      case .showSheet(_):
        return
    }
  }
 
}



