//
//  SimilarQuotationCard.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/19.
//

import SwiftUI

struct SimilarQuotationCard {
  let quotation = Quotation.shared
  var intent: SimilarQuotationIntentType
  var index: Int
  var trimName: String
  let leadingPadding = CGFloat(21).scaledHeight
  let cardHeight = CGFloat(220).scaledHeight
}
extension SimilarQuotationCard: View {
 
  var body: some View {
    VStack(alignment: .leading, spacing: 0) {
        VStack(spacing: 0) {
          SimilarQuotationCardHead(index: index, intent: intent, trimName: trimName)
          SimilarQuotationCardImage(index: index, intent: intent, quotation: quotation)
        }
        .padding(.leading, leadingPadding)
        
        SimilarHMGDataCard(options: intent.state.similarQuotations[index].options, intent: intent)
        .frame(maxHeight: cardHeight)
      }
  }
  
}

