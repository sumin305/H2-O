//
//  QuotationState.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/16.
//

import Foundation
import Combine


final class Quotation: ObservableObject {
  
  init(initialState: State) {
    state = initialState
  }
  
  typealias State = QuotationModel.State
  
  
  @Published var state: State = .init(
    totalPrice: CLNumber(0),
    quotation: CarQuotation.mock(),
    minPrice: CLNumber(0),
    maxPrice: CLNumber(99999999))
  var cancellable: Set<AnyCancellable> = []
}
