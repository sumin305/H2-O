//
//  ModelTypeSelectionService.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/24.
//

import Foundation


protocol ModeltypeSelectionService {
  
  func updatePowertrain(option: ModelTypeOption)
  func updateBodytype(option: ModelTypeOption)
  func updateDrivetrain(option: ModelTypeOption)
  func powertrainName() -> String
  func drivetrainName() -> String
  
}

extension Quotation: ModeltypeSelectionService {
  func powertrainName() -> String {
    state.quotation.powertrain.name
  }
  
  func drivetrainName() -> String {
    state.quotation.drivetrain.name
  }
  
  func updatePowertrain(option: ModelTypeOption) {
    state.quotation.powertrain = option
  }
  
  func updateBodytype(option: ModelTypeOption) {
    state.quotation.bodytype = option
  }
  
  func updateDrivetrain(option: ModelTypeOption) {
    state.quotation.drivetrain = option
  }

}
