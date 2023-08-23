//
//  CLNavigationViewAlert.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/23.
//

import Foundation
import SwiftUI

extension CLNavigationView {
  enum AlertCase: Equatable {
    case quit
    case guide
  }
}
extension CLNavigationView {
  func makeAlertView(alertCase: AlertCase) -> some View {
    switch alertCase {
      case .quit:
        let buttonContent = ButtonContent(cancelAction: {
          showQuitAlert = false
        }, submitAction: {
          showQuitAlert = true
        }, submitText: "종료")
        
        return CLAlertView<CLQuitAlertContentView, ButtonContent, AlertDoubleButton>(items: buttonContent) { item in
          AlertDoubleButton(cancelAction: item.cancelAction, submitAction: item.submitAction, cancelText: item.cancelText, submitText: item.submitText)}
      case .guide:
        return EntryGuide()
        
    }
  }
}
