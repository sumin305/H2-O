//
//  QuotationState.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/16.
//

import Foundation
import Combine

final class Quotation: ObservableObject {

  static let shared = Quotation(initialState: .init(totalPrice: CLNumber(0)))

  private init(initialState: State) {
    state = initialState
  }
  @Published var state: State = .init(totalPrice: CLNumber(0))
  var cancellable: Set<AnyCancellable> = []
}

extension Quotation: QuotationIntentType, IntentType {


  typealias State = QuotationModel.State
  typealias ViewAction = QuotationModel.ViewAction

  func mutate(action: QuotationModel.ViewAction, viewEffect: (() -> Void)?) {
    switch action {
      case .isTrimSelected(let carQuotation):
        state.detail = carQuotation
      case .isPriceChanged
    }
  }
}

protocol QuotationIntentType {

  var state: QuotationModel.State { get }

  func send(action: QuotationModel.ViewAction)

  func send(action: QuotationModel.ViewAction, viewEffect: (() -> Void)?)

}
