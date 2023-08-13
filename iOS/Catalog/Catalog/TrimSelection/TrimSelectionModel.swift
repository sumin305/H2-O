//
//  TrimSelectionModel.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/11.
//

 import Foundation

 enum TrimSelectionModel {

   struct State: Equatable {
     static func == (lhs: TrimSelectionModel.State, rhs: TrimSelectionModel.State) -> Bool {
       return true
     }

     var trims: [Trim] = []
     var selectedTrim: Trim?
     var isSelectedTrim: Bool  // 트림 선택되었는 지에 따라 하단 버튼 활성화 & 다음 단계로 넘어갈 수 있는지 판단
  }

  enum ViewAction: Equatable {
    case onTapTrimSelectButton
    case enteredTrimPage
    case onTapTrim
  }
 }
