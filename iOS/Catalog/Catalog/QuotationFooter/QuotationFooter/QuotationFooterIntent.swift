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
  
  init(initialState: State) {
    state = initialState
  }
  
  typealias State = QuotationFooterModel.State
  typealias ViewAction = QuotationFooterModel.ViewAction
  
  @Published var state: State = .init()
  
  var cancellable: Set<AnyCancellable> = []
  
  private var repostitory: QuotationRepositoryProtocol
  
}

extension QuotationFooterIntent: QuotationFooterIntentType, IntentType {
  
  typealias State = QuotationModel.State
  typealias ViewAction = QuotationModel.ViewAction
  
  func mutate(action: QuotationModel.ViewAction, viewEffect: (() -> Void)?) {
  
  }
}



