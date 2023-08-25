//
//  ExteriorSelectionIntentType.swift
//  Catalog
//
//  Created by Jung peter on 8/15/23.
//

import Foundation
import Combine

protocol ExteriorSelectionIntentType {

  var state: ExteriorSelectionModel.State { get }

  func send(action: ExteriorSelectionModel.ViewAction)

  func send(action: ExteriorSelectionModel.ViewAction, viewEffect: (() -> Void)?)

}

final class ExternalSelectionIntent: ObservableObject {

  init(initialState: State, repository: ExteriorColorRepositoryProtocol, quotation: ExteriorSelectionService) {
    state = initialState
    self.repository = repository
    self.quotation = quotation
  }

  private var repository: ExteriorColorRepositoryProtocol

  typealias State = ExteriorSelectionModel.State

  typealias ViewAction = ExteriorSelectionModel.ViewAction

  @Published var state: State

  var cancellable: Set<AnyCancellable> = []

  private var quotation: ExteriorSelectionService
  let imageCacher = ImageCacheService.shared

}

extension ExternalSelectionIntent: ExteriorSelectionIntentType, IntentType {

  func mutate(action: ExteriorSelectionModel.ViewAction, viewEffect: (() -> Void)?) {
    switch action {
    case .onAppear:
      Task {
        do {
          let externalColors = try await repository.fetch(with: state.selectedTrimId)
          send(action: .fetchColors(colors: externalColors))
          
        } catch let _ {
          // TODO: Error Handling
        }
      }
    case .fetchColors(let colors):
      let colorStates = colors.map { ExteriorColorState(isSelected: false, color: $0) }
      state.colors = colorStates
        
        let colorCount = state.colors.count
        state.images = Array(repeating: [], count: colorCount)
        for i in 0..<colorCount {
          var imgs: [Data] = Array(repeating: Data(), count: 60)
          Task {
            do {
              for urlIndex in 0..<state.colors[colorCount-1].color.exteriorImages.count {
                imgs[urlIndex] = try await imageCacher.setImage(state.colors[colorCount-1].color.exteriorImages[urlIndex])
              }
              state.images.append(imgs)
            } catch {
              
            }
          }
        }
//        Task {
//          do {
//            for colorState in state.colors {
//              for url in colorState.color.exteriorImages {
//                let img = try await imageCacher.setImage(url)
//                imgs.append()
//              }
//              state.images.append(imgs)
//            }
//          } catch {
//            state.images = []
//          }
//        }
      if !colorStates.isEmpty {
        send(action: .onTapColor(id: colorStates[0].color.id))
        // TODO:
      } 
    case .changeSelectedExteriorImageURL:
      print("External Image Urls")
    case .onTapColor(let id):
      state.selectedColorId = id
        state.currentSelectedIndex = state.colors.firstIndex(where: {$0.color.id == id}) ?? 0
        print(state.currentSelectedIndex)
        quotation.updateExteriorColor(to: state.colors[state.colors.firstIndex(where: {$0.isSelected}) ?? 0].color)
      for i in state.colors.indices {
        if state.colors[i].color.id == id {
          state.colors[i].isSelected = true
          send(action: .changeSelectedExteriorImageURL(url: state.colors[i].color.exteriorImages))
        } else {
          state.colors[i].isSelected = false
        }
      }
    }
  }

}
