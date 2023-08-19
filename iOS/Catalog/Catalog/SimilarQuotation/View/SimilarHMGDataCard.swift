//
//  SimilarHMGDataCard.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/19.
//

import SwiftUI


struct SimilarHMGDataCard: View {

  var options: [SimilarQuotationOption]
  var intent: SimilarQuotationIntentType
  var body: some View {
    ZStack(alignment: .leading) {
      
      VStack(alignment: .leading) {
        HMGTag()
        Spacer()
      }

      VStack(alignment: .leading , spacing: 16) {
        
          Text("내 견적에 없는 옵션이에요.")
            .catalogFont(type: .TextKRMedium12)
            .padding(.top, CGFloat(33).scaledHeight)
            .padding(.bottom, CGFloat(9).scaledHeight)
        
        HStack(spacing: 8) {
          ForEach(options.indices) { optionIndex in
            SimilarHMGOption(option: options[optionIndex]) {
              intent.send(action: .optionSelected(selectedOption: options[optionIndex]))
            }
          }
        }
      }
      .padding(.bottom, 12)
    }
    .frame(maxWidth: .infinity, maxHeight: CGFloat(241).scaledHeight)
    .background(Color.gray50)
  }
}
