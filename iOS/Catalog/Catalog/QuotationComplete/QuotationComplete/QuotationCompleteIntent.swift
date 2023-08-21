//
//  QuotationCompleteIntent.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/21.
//

import Foundation
import Combine

protocol QuotationCompleteIntentType {

  var state: QuotationCompleteModel.State { get }

  func send(action: QuotationCompleteModel.ViewAction)

  func send(action: QuotationCompleteModel.ViewAction, viewEffect: (() -> Void)?)
  
  var repository: QuotationCompleteRepositoryProtocol { get }
  
}

final class QuotationCompleteIntent: ObservableObject {

  init(initialState: State, repository: QuotationCompleteRepositoryProtocol) {
    state = initialState
    self.repository = repository
  }

  typealias State = QuotationCompleteModel.State
  typealias ViewAction = QuotationCompleteModel.ViewAction

  @Published var state: State

  var cancellable: Set<AnyCancellable> = []
  private(set) var repository: QuotationCompleteRepositoryProtocol
}

extension QuotationCompleteIntent: QuotationCompleteIntentType, IntentType {


  func mutate(action: QuotationCompleteModel.ViewAction, viewEffect: (() -> Void)?) {
    switch action {
      case .onAppear: return
      case .onTapCompleteButton: return
      case .onTapDeleteButton: return
      case .onTapModifyButton: return
    }
  }
}
