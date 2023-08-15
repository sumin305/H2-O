//
//  Powertrain.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/15.
//

import Foundation

struct Powertrain {
  var id: Int
  var name: String
  var price: CLNumber
  var choiceRatio: Int
  var description: String
  var image: URL
  var maxOutput: MaxOutputFromEngine
  var maxTorque: MaxTorqueFromEngine
}

struct BodyType {
  var id: Int
  var name: String
  var price: CLNumber
  var choiceRatio: Int
  var description: String
  var image: URL
}

struct Drivetrain {
  var id: Int
  var name: String
  var price: CLNumber
  var choiceRatio: Int
  var description: String
  var image: URL
}

struct InternalColor {
  var id: Int
  var name: String
  var choiceRatio: Int
  var price: CLNumber
  var hexCode: String
  var images: [URL]
}

struct ExternalColor {
  var id: Int
  var name: String
  var choiceRatio: Int
  var price: CLNumber
  var hexCode: String
  var images: [URL]
}
