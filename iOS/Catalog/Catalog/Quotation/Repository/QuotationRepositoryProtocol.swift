//
//  QuotationRepositoryProtocol.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/21.
//

import Foundation

protocol QuotationRepositoryProtocol {
  
  func saveFinalQuotation(with: CarQuotation) async throws -> Int
}
