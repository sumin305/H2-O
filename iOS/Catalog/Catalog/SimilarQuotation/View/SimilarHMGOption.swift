//
//  SimilarHMGOption.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/20.
//

import SwiftUI

struct SimilarHMGOption: View {
  let option: SimilarQuotationOption
  var action: () -> Void
  var body: some View {
    Button {
      action()
    } label: {
      VStack(spacing: 0) {
        AsyncImage(url: option.image) { image in
          image
            .resizable()
        } placeholder: {
          ProgressView()
        }
        .frame(height: CGFloat(89).scaledHeight)

        VStack(alignment: .leading) {
          Text(option.name)
            .catalogFont(type: .HeadKRMedium14)
            .frame(height: CGFloat(45).scaledHeight)
          
          HStack {
            Text(option.price.signedWon)
              .catalogFont(type: .HeadKRMedium14)
            Spacer()
            Image("check")
          }
        }
      }
      .selectedCardStyle(isSelected: option.isSelected)
      .buttonSelected(isselected: option.isSelected)
    }
    .frame(height: CGFloat(171).scaledHeight)
    .buttonStyle(EmptyButtonStyle())
  }

}
