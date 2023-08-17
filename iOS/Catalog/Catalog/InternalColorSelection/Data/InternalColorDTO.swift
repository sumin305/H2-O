//
//  InternalColorDTO.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/15.
//

import Foundation

struct InternalColorDTO: Decodable {
  var id: Int?
  var name: String?
  var choiceRatio: Int?
  var price: Int?
  var fabricImage: URL?
  var bannerImage: URL?
}

extension InternalColorDTO {
  func toDomain() throws -> InternalColorModel {

    return InternalColorModel(id: id ?? 0,
                              name: name ?? "",
                              choiceRatio: choiceRatio ?? 0,
                              price: CLNumber(Int32(price ?? 0)),
                              fabricImage: fabricImage,
                              bannerImage: bannerImage)
  }
}
