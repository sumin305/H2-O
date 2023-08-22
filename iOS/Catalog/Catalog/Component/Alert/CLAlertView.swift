//
//  CLAlert.swift
//  Catalog
//
//  Created by Jung peter on 8/5/23.
//

import SwiftUI

struct CLAlertView<AlertContent: AlertContentable, ButtonContent: ButtonContentable>: AlertView {
    
  var info: String?
  var cancelAction: (() -> Void)?
  var submitAction: () -> Void
  var cancelText: String?
  var submitText: String?
  var body: AlertViewComponent<AlertContent, ButtonContent> {
    AlertViewComponent(cancelAction: cancelAction, submitAction: submitAction, cancelText: cancelText, submitText: submitText, content: {
      AlertContent(info: info)
    }) {
      ButtonContent(cancelAction: cancelAction, submitAction: submitAction, cancelText: cancelText, submitText: submitText)
    }
  }
}

extension CLAlertView {
  @ViewBuilder
  static func build(cancelAction: @escaping () -> Void, submitAction: @escaping () -> Void, cancelText: String?, submitText: String?) -> some View {
    CLAlertView(cancelAction: cancelAction, submitAction: submitAction, cancelText: cancelText, submitText: submitText)
  }
}



