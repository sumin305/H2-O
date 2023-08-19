//
//  SimilarQuotationCard.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/19.
//

import SwiftUI

struct SimilarQuotationCard: View {

    var intent: SimilarQuotationIntentType
    var index: Int
    var trimName: String
    var body: some View {
      VStack(alignment: .leading) {

        VStack(alignment: .leading) {
          Text(index.toString())
            .catalogFont(type: .TextKRRegular12)
            .foregroundColor(Color.gray900)
          Text(trimName)
            .catalogFont(type: .HeadKRBold26)
            .foregroundColor(Color.primary0)
          
        }
        .padding(.top, 20)
        .padding(.leading, 24)

        HStack {
          Spacer()
          AsyncImage(url: intent.state.similarQuotations[index].image, content: { image in
            image
              .resizable()
              .scaledToFill()
              .frame(width: CGFloat(343).scaledWidth)
          }, placeholder: {
            ProgressView()
          })
        }
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

}


extension Int {
  func toString() -> String {
    switch self {
      case 1 :  return "첫"
      case 2: return "두"
      case 3: return "세"
      case 4: return "네"
      default: return ""
    }
  }
  
}
