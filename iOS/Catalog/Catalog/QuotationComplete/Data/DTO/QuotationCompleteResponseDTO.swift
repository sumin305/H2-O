//
//  QuotationCompleteResponseDTO.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/21.
//

import Foundation

enum QuotationCompleteToDomainError: Error {
  case noQuotationIdInRespoinse
}

struct QuotationCompleteResponseDTO: Decodable {
  let quotationId: Int?
}

extension QuotationCompleteResponseDTO {
  func toDomain() throws -> Int {
    guard let id = quotationId else { throw QuotationCompleteToDomainError.noQuotationIdInRespoinse}
    return id
  }
}
