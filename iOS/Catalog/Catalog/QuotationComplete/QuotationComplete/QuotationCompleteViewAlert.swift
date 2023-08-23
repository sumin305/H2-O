//
//  QuotationCompleteViewAlert.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/23.
//

import Foundation
import SwiftUI


extension QuotationCompleteView {
  enum AlertCase {
    case modify(title: String)
    case delete
  }
}

extension QuotationCompleteView {
  func modifyAlertView(index: Int, title: String) -> some View {
    let buttonContent = ButtonContent(cancelAction: {
      intent.send(action: .onTapCancelButton)
    }, submitAction: {
      intent.send(action: .movePage(navigationIndex: index))
    }, submitText: "이동")
    return CLAlertView<CLSingleLineAlertContentView, ButtonContent, AlertDoubleButton>(info : "\(title) 선택 페이지로 이동합니다.", items: buttonContent) { item in
      AlertDoubleButton(cancelAction: item.cancelAction, submitAction: item.submitAction, cancelText: item.cancelText, submitText: item.submitText)
    }
  }
}
