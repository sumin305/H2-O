//
//  TrimSelectionRepository.swift
//  Catalog
//
//  Created by Jung peter on 8/9/23.
//

import Foundation

protocol TrimSelectionRepositoryProtocol {

  func fetchTrims(in vehicleId: Int) async throws -> [Trim]
  func fetchDefaultOptionsByTrim(in trim: Trim) async throws -> CarQuotation
}

final class TrimSelectionRepository: TrimSelectionRepositoryProtocol {

  private let trimSelectionRequestManager: RequestManagerProtocol

  init(trimSelectionRequestManager: RequestManagerProtocol) {
    self.trimSelectionRequestManager = trimSelectionRequestManager
  }

  func fetchTrims(in vehicleId: Int) async throws -> [Trim] {
    let dto: TrimResponseDTO = try await trimSelectionRequestManager
      .perform(TrimSelectionRequest.fetchTrimList(vehicleId: vehicleId))
    return dto.toDomain()
  }

  func fetchDefaultOptionsByTrim(in trim: Trim) async throws -> CarQuotation {
    let dto: TrimDefaultOptionDTO = try await trimSelectionRequestManager.perform(TrimSelectionRequest.fetchDefaultOption(trimId: trim.id))
    return try dto.toDomain(trim: trim)
  }

}
