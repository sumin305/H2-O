//
//  TrimSelectionIntent.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/11.
//

import Foundation
import Combine

protocol TrimSelectionIntentType {

  var state: TrimSelectionModel.State { get }

  func send(action: TrimSelectionModel.ViewAction)

  func send(action: TrimSelectionModel.ViewAction, viewEffect: (() -> Void)?)
}

final class TrimSelectionIntent: ObservableObject {

  // MARK: - LifeCycle

  init(initialState: State, repository: TrimSelectionRepositoryProtocol, quotation: Quotation) {
    state = initialState
    self.repository = repository
    self.quotation
  }

  // MARK: - Internal
  typealias State = TrimSelectionModel.State
  typealias ViewAction = TrimSelectionModel.ViewAction

  private var repository: TrimSelectionRepositoryProtocol
  private var quotation = Quotation.shared

  @Published var state: State = State(selectedTrim: nil, carId: 1)

  var cancellable: Set<AnyCancellable> = []
}

extension TrimSelectionIntent: TrimSelectionIntentType, IntentType {

  func mutate(action: TrimSelectionModel.ViewAction, viewEffect: (() -> Void)?) {
    switch action {
      case .enteredTrimPage:
        Task {
          do {
            let trims = try await repository.fetchTrims(in: state.carId)
            self.send(action: .fetchTrims(trims: trims))
          } catch let error {
            print("hello")
            state.error = error as? TrimSelectionError
          }
        }

      case .fetchTrims(let trims):
        if !trims.isEmpty {
          state.trims = trims
          state.selectedTrim = trims.first
        } else {
          // TODO: trim Intent Error 만들고 정의하삼
        }

      case .onTapTrimSelectButton:
        guard let trim = state.selectedTrim else { return }
        quotation.send(action: .isTrimChanged(trim: trim))
        Task {
          do {
            let defaultQuotation = try await repository.fetchDefaultOptionsByTrim(in: trim)
            quotation.send(action: .isTrimSelected(defaultCarQuotation: defaultQuotation))
            print(quotation.state.totalPrice, "@@@@@@@@")
          } catch let error {
            state.error = error as? TrimSelectionError
          }
        }
        // 트림 선택할 경우. 트림 id
      case .trimSelected(let index):
        state.selectedTrim = state.trims[index]
    }
  }
}
