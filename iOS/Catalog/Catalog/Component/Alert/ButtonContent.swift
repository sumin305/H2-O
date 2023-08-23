//
//  ButtonContent.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/24.
//

import Foundation

protocol ButtonContentable {
  var cancelAction: (() -> Void)? { get set }
  var submitAction: () -> Void { get set }
  var cancelText: String? { get set }
  var submitText: String? { get set }
  
  init(cancelAction: (() -> Void)?, submitAction: @escaping () -> Void, cancelText: String?, submitText: String?)
}

struct ButtonContent: ButtonContentable {
  var cancelAction: (() -> Void)?
  
  var submitAction: () -> Void
  
  var cancelText: String?
  
  var submitText: String?
  
  init(cancelAction: (() -> Void)? = nil, submitAction: @escaping () -> Void, cancelText: String? = nil, submitText: String? = nil) {
    
    self.cancelText = cancelText
    self.cancelAction = cancelAction
    self.submitText = submitText
    self.submitAction = submitAction
  }
  
  
}
