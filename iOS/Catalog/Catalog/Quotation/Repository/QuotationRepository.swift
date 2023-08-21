//
//  QuotationRepository.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/21.
//

import Foundation

final class QuotationRepository: QuotationRepositoryProtocol {

  private let quotationRequestManager: RequestManagerProtocol
  
  init(quotationRequestManager: RequestManagerProtocol) {
    self.quotationRequestManager = quotationRequestManager
  }
  func saveFinalQuotation(with quotation: CarQuotation) async throws -> Int {
    let dto: QuotationCompleteResponseDTO = try await quotationRequestManager.perform(QuotationCompleteRequest.saveFinalQuotation(carQuotation: quotation))
    return try dto.toDomain()
  }
}
