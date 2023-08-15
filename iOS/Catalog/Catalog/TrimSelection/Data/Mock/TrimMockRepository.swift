//
//  TrimMockRepository.swift
//  Catalog
//
//  Created by Jung peter on 8/9/23.
//

import Foundation

final class TrimMockRepository: TrimSelectionRepositoryProtocol {

  func fetchTrims(in carId: Int) async throws -> [Trim] {
      let manager = RequestManager(apiManager: MockAPIManager())
      guard let data = JSONLoader.load(with: "Trim") else { return [] }
      let url = URL(string: "https://api.cartalog.com/vehicle/\(carId)")!
      MockURLProtocol.mockURLs = [
        url: (nil, data, HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil))
      ]
    print(url)
      let dto: TrimResponseDTO = try await manager.perform(TrimSelectionRequest.fetchTrimList(carId: carId))
      print(dto)
      return dto.toDomain()
    }

  func fetchDefaultOptionsByTrim(in trim: Trim) async throws -> CarQuotation {
    let manager = RequestManager(apiManager: APIManager())
    let dto: TrimDefaultOptionDTO = try await
    manager.perform(TrimSelectionRequest.fetchDefaultOption(trimId: trim.id))
    return try dto.toDomain(trim: trim)
  }
}
