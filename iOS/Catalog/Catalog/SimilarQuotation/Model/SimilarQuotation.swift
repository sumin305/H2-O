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
}
