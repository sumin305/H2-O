//
//  SimilarQuotation.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/19.
//

import Foundation

struct SimilarQuotation: Equatable {
  var powertrainName: String
  var bodytypeName: String
  var drivetrainName: String
  var image: URL?
  var options: [SimilarQuotationOption]
  
  static func mock() -> SimilarQuotation {
    .init(powertrainName: "디젤 2.2",
          bodytypeName: "7인승",
          drivetrainName: "2WD",
          options: [
            SimilarQuotationOption.mock(),
            SimilarQuotationOption.mock(),
            SimilarQuotationOption.mock()
          ])
  }
}