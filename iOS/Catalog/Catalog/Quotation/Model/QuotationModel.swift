//
//  QuotationContainerModel.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/14.
//

import Foundation

enum QuotationModel {

  struct State: Equatable {

    var quotationPrice: CLNumber
    var quotation: CarQuotation // 모델, 트림, 파워트레인, 바디타입, 구동방ㅎ식, 외장 내장, 옵션들

  }
}
