//
//  QuotationState.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/16.
//

import Foundation
import Combine

final class Quotation: ObservableObject {
  
  init(initialState: State) {
    state = initialState
  }
  
  @Published var state: State = .init(
    totalPrice: CLNumber(0),
    quotation: CarQuotation.mock(),
    minPrice: CLNumber(0),
    maxPrice: CLNumber(99999999))
  var cancellable: Set<AnyCancellable> = []
}

extension Quotation: QuotationIntentType, IntentType {
  
  typealias State = QuotationModel.State
  typealias ViewAction = QuotationModel.ViewAction
  
  func mutate(action: QuotationModel.ViewAction, viewEffect: (() -> Void)?) {
    switch action {
        
      case .isTrimSelected(let carQuotation, let minPrice, let maxPrice):
        state.quotation = carQuotation
        state.minPrice = minPrice
        state.maxPrice = maxPrice
        send(action: .isPriceChanged)
        
      case .isTrimChanged(let trim):
        state.quotation.trim = trim
        send(action: .isPriceChanged)
        
      case .isPowertrainChanged(let powertrain):
        state.quotation.powertrain = powertrain
        send(action: .isPriceChanged)
        
      case .isBodyTypeChanged(let bodytype):
        state.quotation.bodytype = bodytype
        send(action: .isPriceChanged)
        
      case .isDrivetrainChanged(let drivetrain):
        state.quotation.drivetrain = drivetrain
        send(action: .isPriceChanged)
        
        // TODO: - 색상 모델 채우기
      case .isExternalColorChanged: return
      case .isInternalColorChanged: return
      case .isOptionChanged(let option): return
        
      case .isPriceChanged:
        state.totalPrice = state.quotation.calculateTotalPrice()
//      case .onTapCompleteButton:
//        Task {
//          do {
//               let quotationId = try await repostitory.saveFinalQuotation(with: state.quotation )
//               print(quotationId)
//          } catch let error {
//            print(error.localizedDescription)
//          }
//        }
      case .similarOptionsAdded(let options):
        state.quotation.options.append(contentsOf: options)
      case .similarOptionsDeleted(let optionIndex):
        state.quotation.options = state.quotation.options.filter{$0.id != optionIndex}
      case .onTapCompleteButton:
        return
    }
  }
}

protocol QuotationIntentType {
  
  var state: QuotationModel.State { get }
  
  func send(action: QuotationModel.ViewAction)
  
  func send(action: QuotationModel.ViewAction, viewEffect: (() -> Void)?)
  
}
