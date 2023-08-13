//
//  TrimScrollView.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/12.
//

import SwiftUI

struct SnapCarousel<Content: View, T: Identifiable>: View {

  var content: (T) -> Content
  var items: [T]

  var spacing: CGFloat
  var leadingSpace: CGFloat
  var trailingSpace: CGFloat

  @Binding var index: Int

  init(items: [T], spacing: CGFloat = 16, leadingSpace: CGFloat, trailingSpace: CGFloat, index: Binding<Int>, @ViewBuilder content: @escaping (T) -> Content) {
    self.items = items
    self.spacing = spacing
    self.leadingSpace = leadingSpace
    self.trailingSpace = trailingSpace
    self._index = index
    self.content = content
  }

  @GestureState var offset: CGFloat = 0
  @State var currentIndex: Int = 0
}

extension SnapCarousel {

  var body: some View {
    GeometryReader { proxy in
      HStack(spacing: spacing) {
        ForEach(items) { item in
          content(item)
            .frame(width: proxy.size.width)
        }
      }
      .padding(, spacing)

    }
  }

}

struct SnapCarousel_Previews: PreviewProvider {
  static var previews: some View {
    TrimSelectionView.build(intent: TrimSelectionIntent(initialState: .init(selectedTrim: nil, isSelectedTrim: false)))
  }
}     CLBudgetRangeView.build(
  intent: CLBudgetRangeIntent(initialState: .init(currentQuotationPrice: CLPrice(40000000), budgetPrice: CLPrice(40750000)))
