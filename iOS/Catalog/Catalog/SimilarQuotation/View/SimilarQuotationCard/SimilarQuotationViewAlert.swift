//
//  SimilarQuotationViewAlert.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/23.
//

import Foundation
import SwiftUI

extension SimilarQuotationView {
  enum AlertCase {
    case help
    case noOption
    case optionButQuit
    case addOption
  }
}

extension SimilarQuotationView {
  func noOptionAlertView() -> some View {
    let buttonContent = ButtonContent(cancelAction: {
      showAlert = false
    }, submitAction: {
      showAlert = false
      intent.send(action: .choiceQuit)
    }, submitText: "종료")
    return CLAlertView<CLQuitAlertContentView, ButtonContent, AlertDoubleButton>(items: buttonContent) { item in
      AlertDoubleButton(cancelAction: item.cancelAction, submitAction: item.submitAction, cancelText: item.cancelText, submitText: item.submitText)
    }
  }
  
  func optionButQuitAlertView() -> some View {
    let buttonContent = ButtonContent(cancelAction: {
      showAlert = false
    }, submitAction: {
      showAlert = false
      intent.send(action: .choiceQuit)
    })
    return CLAlertView<CLOptionQuitAlertContentView, ButtonContent, AlertDoubleButton>(info: String(state.selectedOptions.count), items: buttonContent) { item in
      AlertDoubleButton(cancelAction: item.cancelAction, submitAction: item.submitAction, cancelText: item.cancelText, submitText: item.submitText)
    }
  }
  
  func addOptionAlertView() -> some View {
    let buttonContent = ButtonContent(cancelAction: {
      showAlert = false
    }, submitAction: {
      showAlert = false
      intent.send(action: .choiceQuit)
    })
    return CLAlertView<CLOptionSelectAlertContentView, ButtonContent, AlertSingleButton>(info: toAlertString(optionName: state.selectedOptions[0].name, count: state.selectedOptions.count), items: buttonContent) { item in
      AlertSingleButton(cancelAction: item.cancelAction, submitAction: item.submitAction, cancelText: item.cancelText, submitText: item.submitText)
    }
  }
}

private extension SimilarQuotationView {
  func toAlertString(optionName: String, count: Int) -> String {
    "[\(optionName)]외 \(count)개"
  }
}
