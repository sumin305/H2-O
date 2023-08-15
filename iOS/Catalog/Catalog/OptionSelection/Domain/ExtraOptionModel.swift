//
//  ExtraOptionModel.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/15.
//

import Foundation

struct ExtraOptionModel: Encodable {
  var isPackage: Bool
  var category: Category
  var name: String
  var hashTags: [HashTag]
  var conainsHmgData: Bool
  var choiceRatio: Int
  var price: CLNumber
}
