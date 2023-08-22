//
//  AlertViewComponent.swift
//  Catalog
//
//  Created by Jung peter on 8/7/23.
//

import SwiftUI

protocol ButtonContentable: View {
  var cancelAction: (() -> Void)? { get set }
  var submitAction: () -> Void { get set }
  var cancelText: String? { get set }
  var submitText: String? { get set }
  
  init(cancelAction: (() -> Void)?, submitAction: @escaping () -> Void, cancelText: String?, submitText: String?)
}

struct AlertViewComponent<AlertContent: View, ButtonContent: ButtonContentable>: View {

  var cancelAction: (() -> Void)?
  var submitAction: () -> Void
  var cancelText: String?
  var submitText: String?
  @ViewBuilder var content: () -> AlertContent
  @ViewBuilder var buttonContent: () -> ButtonContent
  var body: some View {
    DimmedZStack {
      VStack {
        content()
        buttonContent()
      }
      .background(.white)
      .cornerRadius(5)
      .padding(.horizontal, 20)
    }
  }
}

struct AlertSingleViewComponent<AlertContent: View>: View {

  var cancelAction: () -> Void
  var submitAction: () -> Void

  @ViewBuilder var content: () -> AlertContent
  var body: some View {
    DimmedZStack {
      VStack {
        content()
        if ((content.self as? (any AlertContentable)) as? CLOptionSelectAlertContentView) != nil {
          CLButton(mainText: "확인",
                   height: 52,
                   backgroundColor: Color.primary,
                   buttonAction: { submitAction() })
        } else {
          CLDualChoiceButton(leftText: "취소",
                             rightText: "종료",
                             height: 52,
                             leftAction: { cancelAction() },
                             rightAction: { submitAction() })
        }
      
      }
      .background(.white)
      .cornerRadius(5)
      .padding(.horizontal, 20)
    }
  }
}
