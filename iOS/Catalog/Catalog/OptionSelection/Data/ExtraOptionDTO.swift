//
//  ExtraOptionDTO.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/15.
//

import Foundation

struct ExtraOptionDTO: Decodable {
  var isPackage: Bool?
  var id: Int?
  var category: String?
  var name: String?
  var hashTags: [String?]
  var conainsHmgData: Bool?
  var choiceRatio: Int?
  var price: Int?
}
