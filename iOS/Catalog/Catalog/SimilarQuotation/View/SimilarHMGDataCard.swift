//
//  SimilarHMGDataCard.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/19.
//

import SwiftUI


struct SimilarHMGDataCard: View {

  var options: [SimilarQuotationOption]

  var body: some View {
    ZStack(alignment: .leading) {
      
      VStack(alignment: .leading) {
        HMGTag()
        Spacer()
      }

      VStack(alignment: .leading , spacing: 16) {
        
          Text("내 견적에 없는 옵션이에요.")
            .catalogFont(type: .TextKRMedium12)
            .padding(.top, CGFloat(12).scaledHeight)

          
      }
      
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.gray50)
  }
}
