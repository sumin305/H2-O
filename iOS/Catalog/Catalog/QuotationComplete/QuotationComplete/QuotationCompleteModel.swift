//
//  QuotationCompleteModel.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/21.
//

import Foundation

enum QuotationCompleteModel {

  struct State: Equatable {
    var technicalSpec: ResultOfCalculationOfFuelAndDisplacement
    var nextNavIndex: Int
  }

  enum ViewAction {
    case onAppear
    case onTapModifyButton
    case onTapDeleteButton
    case onTapCompleteButton
  }

}
