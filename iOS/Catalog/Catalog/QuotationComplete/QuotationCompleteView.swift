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
  let totalHeight: CGFloat = 534
  var (positionX, positionY): (CGFloat, CGFloat) = (0, 0)
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
        .background(
          Image("QuotationCompleteBackground")
            .resizable()
        )
      } else {

        ZStack {
          GeometryReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                    AsyncImage(url: quotation.state.quotation?.trim.internalImage) { img in
                      img
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    } placeholder: {
                      EmptyView()
                    }
              }
            .frame(minWidth: proxy.size.width, maxHeight: proxy.size.height)
          }
        }
      }
      VStack {
        Spacer()
        CLToggle(isLeft: $isExternal)
          .padding(.vertical, 8)
      }
    }
  }
}

struct QuotationCompleteView_Previews: PreviewProvider {
  static var previews: some View {
    QuotationCompleteView()
  }
}

struct ScrollOffsetKey: PreferenceKey {
  static var defaultValue: CGFloat = .zero
  static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
    value += nextValue()
  }
}
