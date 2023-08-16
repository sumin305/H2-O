//
//  QuotationCompleteView.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/17.
//

import SwiftUI

struct QuotationCompleteView {
  var quotation = Quotation.shared
  let modalTopHeight: CGFloat = 30
  let titleTopPadding: CGFloat = 177
  let externalImageHeight: CGFloat = 222
  @SwiftUI.State var isExternal: Bool = true
}

extension QuotationCompleteView: View {
  var body: some View {
    ZStack {
      if isExternal {
        VStack {
          Spacer().frame(height: titleTopPadding)
          Text(quotation.state.quotation?.trim.name ?? "")
            .catalogFont(type: .HeadKRBold65)
            .foregroundColor(.white)
          AsyncImage(url: quotation.state.quotation?.trim.externalImage) { image in
            image
              .resizable()
              .frame(maxWidth: .infinity, maxHeight: externalImageHeight)
          } placeholder: {
            EmptyView()
          }
          Spacer()
        }
      } else {
        AsyncImage(url: quotation.state.quotation?.trim.internalImage ) { image in
          image
            .resizable()
        } placeholder: {
          EmptyView()
        }
      }
      VStack {
        Spacer()
        CLToggle(isLeft: $isExternal)
      }
    }
    .background(
      Image("QuotationCompleteBackground")
        .resizable()
    )
  }
}

struct QuotationCompleteView_Previews: PreviewProvider {
    static var previews: some View {
        QuotationCompleteView()
    }
}
