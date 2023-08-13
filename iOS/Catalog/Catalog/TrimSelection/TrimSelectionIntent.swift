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

  init(initialState: State) {
    state = initialState
  }
   // MARK: - Internal
   typealias State = TrimSelectionModel.State
   typealias ViewAction = TrimSelectionModel.ViewAction

   @Published var state: State = State(selectedTrim: nil, isSelectedTrim: false)
   var cancellable: Set<AnyCancellable> = []
 }

extension TrimSelectionIntent: TrimSelectionIntentType, IntentType {

  func mutate(action: TrimSelectionModel.ViewAction, viewEffect: (() -> Void)?) {
    switch action {
      case .enteredTrimPage: break
      case .onTapTrimSelectButton: break
      case .onTapTrim: break
    }
  }
}
