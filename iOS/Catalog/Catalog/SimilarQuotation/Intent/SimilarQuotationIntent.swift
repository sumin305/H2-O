//
//  SimilarQuotationIntent.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/19.
//

import Foundation
import Combine

protocol SimilarQuotationIntentType {
  
  var state: SimilarQuotationModel.State { get }
  
  func send(action: SimilarQuotationModel.ViewAction, viewEffect: (() -> Void)?)
  
  func send(action: SimilarQuotationModel.ViewAction)
  
}

final class SimilarQuotationIntent: ObservableObject {
  
  init(initialState: State, repository: SimilarQuotationRepositoryProtocol, navigationIntent: CLNavigationIntentType, budgetRangeIntent: CLBudgetRangeIntentType) {
    state = initialState
    self.repository = repository
    self.navigationIntent = navigationIntent
    self.budgetRangeIntent = budgetRangeIntent
  }
  
  typealias State = SimilarQuotationModel.State
  
  typealias ViewAction = SimilarQuotationModel.ViewAction
  
  @Published var state: State = .init(currentSimilarQuotationIndex: 0,
                                      similarQuotations: [.mock(), .mock(), .mock()],
                                      selectedOptions: [],
                                      alertCase: .noOption)
  
  var cancellable: Set<AnyCancellable> = []
  private var repository: SimilarQuotationRepositoryProtocol
  private var navigationIntent: CLNavigationIntentType
  private var budgetRangeIntent: CLBudgetRangeIntentType
}

extension SimilarQuotationIntent: SimilarQuotationIntentType, IntentType {
  
  func mutate(action: SimilarQuotationModel.ViewAction, viewEffect: (() -> Void)?) {
    switch action {
      case .onAppear(let quotation):
        Task {
          do {
            let similarQuotations = try await repository.fetchSimilarQuotation(quotation: quotation)
            state.similarQuotations = similarQuotations
          } catch(let e) {
            print(String(describing: e))
          }
        }
        
      case .onTapBackButton:
        if state.selectedOptions.isEmpty {
          state.alertCase = .noOption
        } else {
          state.alertCase = .optionButQuit
        }
<<<<<<< feature/iOS/#265
        
      case .onTapAddButton(let title, let count):
        state.alertCase = .addOption(title: title, count: count)
        send(action: .showAlertChanged(showAlert: true))
        
      case .onTapHelpButton:
        state.alertCase = .help
        send(action: .showAlertChanged(showAlert: true))
=======

      case .onTapAddButton:
        print("추가하기 버튼 클릭")
        state.alertCase = .addOption
        Quotation.shared.send(action: .similarOptionsAdded(option: state.selectedOptions))
        
      case .onTapHelpButton:
        state.alertCase = .help
>>>>>>> feat: 견적 완료 페이지 수정하기, 삭제하기 로직 작성 2
        
      case .optionSelected(let selectedOption):
        if state.selectedOptions.contains(selectedOption) {
          state.selectedOptions = state.selectedOptions.filter { $0 != selectedOption }
        } else {
          state.selectedOptions.append(selectedOption)
        }
        
      case .currentSimilarQuotationIndexChanged(let index):
        state.currentSimilarQuotationIndex = index
        budgetRangeIntent.send(action: .budgetChanged(newBudgetPrice: state.similarQuotations[index].price))
        
      case .choiceQuit:
        send(action: .showAlertChanged(showAlert: false))
        navigationIntent.send(action: .onTapSimilarQuotationBackButton)
        state.selectedOptions = []
        
      case .choiceAdd:
        Quotation.shared.send(action: .similarOptionsAdded(option: state.selectedOptions))
        send(action: .choiceQuit)
        
      case .showAlertChanged(let showAlert):
        state.showAlert = showAlert
    }
  }
}
