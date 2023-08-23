//
//  AlertViewComponent.swift
//  Catalog
//
//  Created by Jung peter on 8/7/23.
//

import SwiftUI



struct AlertViewComponent<AlertContent: View, ButtonContent: ButtonContentable, ButtonContentView: View>: View {

  var cancelAction: (() -> Void)?
  var submitAction: () -> Void
  var cancelText: String?
  var submitText: String?
  @ViewBuilder var content: () -> AlertContent
  @ViewBuilder var buttonContentView: (ButtonContent) -> ButtonContentView
  var body: some View {
    DimmedZStack {
      VStack {
        content()
        buttonContentView(ButtonContent(cancelAction: cancelAction, submitAction: submitAction, cancelText: cancelText, submitText: submitText))
      }
      .background(.white)
      .cornerRadius(5)
      .padding(.horizontal, 20)
    }
  }
}
