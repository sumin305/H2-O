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
        state.quotation = carQuotation
        send(action: .isPriceChanged)
      case .isPowertrainChanged(let powertrain):
        state.quotation?.powertrain = powertrain
        send(action: .isPriceChanged)
      case .isBodyTypeChanged(let bodytype):
        state.quotation?.bodytype = bodytype
        send(action: .isPriceChanged)

      case .isDrivetrainChanged(let drivetrain):
        state.quotation?.drivetrain = drivetrain
        send(action: .isPriceChanged)

      // TODO: - 색상 모델 채우기
      case .isExternalColorChanged: return
      case .isInternalColorChanged: return
      case .isOptionChanged(let option): return

      case .isPriceChanged: return
  //     state.quotation = (state.quotation?.reduce(0) { (sum, element) in

          //          if element === SummaryQuotationInfo {
//            return (element as? SummaryQuotationInfo).price
//          }

        }
    }
  }

// struct CarQuotation {
//    var model: SummaryQuotationInfo = SummaryQuotationInfo(name: "팰리세이드", price: CLNumber(3880000))
//    var trim: Trim
//    var powertrain: PowerTrainModel
//    var bodytype: BodyTypeModel
//    var drivetrain: DriveTrainModel
//    var externalColor: ExternalColorModel
//    var internalColor: InternalColorModel
//    var options: [ExtraOptionModel]
// }

protocol QuotationIntentType {

  var state: QuotationModel.State { get }

  func send(action: QuotationModel.ViewAction)

  func send(action: QuotationModel.ViewAction, viewEffect: (() -> Void)?)

}
