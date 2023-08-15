//
//  ModelTypeResponseDTO.swift
//  Catalog
//
//  Created by Jung peter on 8/14/23.
//

import Foundation

// Powertrain
struct PowerTrainDTO: Codable {
    let id: Int?
    let name: String?
    let price: Int?
    let choiceRatio: Int?
    let description: String?
    let image: String?
    let maxOutput: MaxOutputDTO?
    let maxTorque: MaxTorqueDTO?
}
extension PowerTrainDTO {
  func toDomain() throws -> PowerTrainModel {
    guard let imageURL = URL(string: image ?? "") else { throw ImageError.invaildURL}
    return PowerTrainModel(name: name ?? "",
                           price: CLNumber(Int32(price ?? 0)),
                           choiceRaatio: choiceRatio ?? 0,
                           description: description ?? "",
                           image: imageURL,
                           maxOutput: try (maxOutput ?? MaxOutputDTO(output: 0, minRpm: 0, maxRpm: 0)).toDomain(),
                           maxTorque: try (maxTorque ?? MaxTorqueDTO(torque: 0, minRpm: 0, maxRpm: 0)).toDomain())
  }
}

struct MaxOutputDTO: Codable {
    let output: Double?
    let minRpm: Int?
    let maxRpm: Int?
}
extension MaxOutputDTO {
  func toDomain() throws -> MaxOutputFromEngine {
    return MaxOutputFromEngine(output: output ?? 0,
                               minRPM: minRpm ?? 0,
                               maxRPM: maxRpm ?? 0)
  }
}

struct MaxTorqueDTO: Codable {
    let torque: Double?
    let minRpm: Int?
    let maxRpm: Int?
}
extension MaxTorqueDTO {
  func toDomain() throws -> MaxTorqueFromEngine {
    return MaxTorqueFromEngine(torque: torque ?? 0,
                               minRPM: minRpm ?? 0,
                               maxRPM: maxRpm ?? 0)
  }
}

// Bodytype
struct BodyTypeDTO: Codable {
    let id: Int?
    let name: String?
    let price: Int?
    let choiceRatio: Int?
    let description: String?
    let image: String?
}
extension BodyTypeDTO {
  func toDomain() throws -> BodyTypeModel {
    guard let imageURL = URL(string: image ?? "") else { throw ImageError.invaildURL}
    return BodyTypeModel(name: name ?? "",
                           price: CLNumber(Int32(price ?? 0)),
                           choiceRaatio: choiceRatio ?? 0,
                           description: description ?? "",
                           image: imageURL)
  }
}
// Drivetrain
struct DriveTrainDTO: Codable {
    let id: Int?
    let name: String?
    let price: Int?
    let choiceRatio: Int?
    let description: String?
    let image: String?
}
extension DriveTrainDTO {
  func toDomain() throws -> DriveTrainModel {
    guard let imageURL = URL(string: image ?? "") else { throw ImageError.invaildURL}
    return DriveTrainModel(name: name ?? "",
                           price: CLNumber(Int32(price ?? 0)),
                           choiceRaatio: choiceRatio ?? 0,
                           description: description ?? "",
                           image: imageURL)
  }
}
// Root
struct ModelTypeResponseDTO: Codable {
    let powertrains: [PowerTrainDTO]?
    let bodytypes: [BodyTypeDTO]?
    let drivetrains: [DriveTrainDTO]?
}
