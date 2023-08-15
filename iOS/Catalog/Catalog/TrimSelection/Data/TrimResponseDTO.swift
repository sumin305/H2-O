//
//  TrimResponseDTO.swift
//  Catalog
//
//  Created by Jung peter on 8/9/23.
//

import Foundation

struct TrimResponseDTO: Decodable {
  var trims: [TrimDTO]?
}

extension TrimResponseDTO {
  func toDomain() -> [Trim] {
    guard let trims = trims else { return [] }
    return trims.compactMap { try? $0.toDomain() }
  }
}

struct TrimDTO: Decodable {
  var id: Int?
  var name: String?
  var description: String?
  var price: Int?
  var images: [String]?
  var options: [TrimOptionDTO]?
}

struct HMGDatum {
  var optionTitle: String
  var optionFrequency: Int
}

extension TrimDTO {
  func toDomain() throws -> Trim {
    return Trim(    id: id ?? 1234,
                    name: name ?? "르블랑",
                    description: description ?? "",
                    price: CLNumber(Int32(price ?? 0)),
                    externalImage: URL(string: images?[0] ?? ""),
                    internalImage: URL(string: images?[1] ?? ""),
                    hmgData: options?.map { $0.toDomain() } ?? [])
  }
}

struct TrimOptionDTO: Decodable {
  var dataLabel: String?
  var frequency: Int?
}

extension TrimOptionDTO {
  func toDomain() -> HMGDatum {
    return HMGDatum(optionTitle: dataLabel ?? "", optionFrequency: frequency ?? 0)
  }
}

struct TrimDefaultOptionDTO: Decodable {
  var powertrain: PowerTrainDTO?
  var bodytype: BodyTypeDTO?
  var drivetrain: DriveTrainDTO?
  var externalColor: ExternalColorDTO?
  var internalColor: InternalColorDTO?
}

extension TrimDefaultOptionDTO {
  func toDomain(trim: Trim) throws -> CarQuotation {

    // TODO.. 에러처리 
    CarQuotation(trim: trim,
                 powertrain: try powertrain!.toDomain(),
                 bodytype: try bodytype!.toDomain(),
                 drivetrain: try drivetrain!.toDomain(),
                 externalColor: try externalColor!.toDomain(),
                 internalColor: try internalColor!.toDomain(),
                 options: []
    )
  }
}
