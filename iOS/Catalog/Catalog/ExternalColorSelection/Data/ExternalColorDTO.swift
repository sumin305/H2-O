//
//  ExternalColorDTO.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/15.
//

import Foundation

struct ExternalColorDTO: Decodable {
  var id: Int
  var name: String
  var choiceRatio: Int
  var price: CLNumber
  var hexCode: String
  var images: [URL]
}
