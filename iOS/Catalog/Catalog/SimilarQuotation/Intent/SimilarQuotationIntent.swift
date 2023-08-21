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
  
  init(initialState: State) {
    state = initialState
  }
  
  typealias State = SimilarQuotationModel.State
  
  typealias ViewAction = SimilarQuotationModel.ViewAction
  
  @Published var state: State = .init(similarQuotations: [.mock(), .mock(), .mock()],
                                      selectedOptions: [])
  
  var cancellable: Set<AnyCancellable> = []
  
}

extension SimilarQuotationIntent: SimilarQuotationIntentType, IntentType {
  
  func mutate(action: SimilarQuotationModel.ViewAction, viewEffect: (() -> Void)?) {
    switch action {
      case .onAppear(let quotation):
        // TODO: - 서버에서 유사견적 받아오기
        print("페이지 이동")
      case .onTapBackButton:
        // TODO: 옵션 선택 안했을 경우
        // TODO: 옵션 선택은 했지만 추가 안한 경우
        print("뒤로가기 버튼 클릭")
      case .onTapAddButton:
        // TODO: 알림창 띄우고 이전 화면으로
        print("추가하기 버튼 클릭")
      case .optionSelected(let selectedOption):
        if state.selectedOptions.contains(selectedOption) {
          state.selectedOptions = state.selectedOptions.filter { $0 != selectedOption }
        } else {
          state.selectedOptions.append(selectedOption)
        }
    }
  }
}
