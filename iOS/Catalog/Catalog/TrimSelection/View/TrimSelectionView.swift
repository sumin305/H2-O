//
//  TrimSelectView.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/11.
//

import SwiftUI

struct TrimSelectionView: IntentBindingType {
  @StateObject var container: Container<TrimSelectionIntentType, TrimSelectionModel.State>
  var intent: TrimSelectionIntentType { container.intent }
  var state: TrimSelectionModel.State { intent.state }

  @SwiftUI.State var currentIndex = 0
  let mockTrims = [Trim.mockTrim(), Trim.mockTrim(), Trim.mockTrim(), Trim.mockTrim()]

}

extension TrimSelectionView {
  var isTrimSelectedBinding: Binding<Bool> {
    .init(get: { state.isSelectedTrim },
          set: { _ in intent.send(action: .onTapTrimSelectButton) })
  }

}

extension TrimSelectionView: View {
  var body: some View {
    VStack {
      HStack {
        Text("트림을 선택해주세요.")
          .catalogFont(type: .HeadKRMedium18)
        Spacer()
      }
      .padding(.leading, 20)
      .padding(.top, 20)

      SnapCarousel(items: mockTrims,
                   spacing: 16,
                   trailingSpace: 32,
                   index: $currentIndex) { trim in
        GeometryReader { proxy in
          let size = proxy.size
          TrimCardView(trim: trim)
            .frame(width: size.width, height: size.height)
        }
      }
      .padding(.vertical, 12)

      // Indicator
      HStack(spacing: 10) {
        ForEach(0..<mockTrims.count, id: \.self) { index in
          Capsule()
            .fill(currentIndex == index ? Color.primary0 : Color.gray200)
            .frame(width: (currentIndex == index ? 24 : 8), height: 8)
//            .animation(.default, value: currentIndex = index)

//            .scaleEffect((currentIndex == index) ? 1.4 : 1)
        }
      }
      .padding(.bottom, 20)

      CLInActiveButton(isTrimSelected: isTrimSelectedBinding,
                       mainText: "Le Blanc 선택하기",
                       inActiveText: "옵션을 선택해 추가해보세요.",
                       height: 60,
                       buttonAction: { print("선택하기") })
      Spacer().frame(height: 0.1)
    }
  }
}

extension TrimSelectionView {
  @ViewBuilder
  static func build(intent: TrimSelectionIntent) -> some View {
    TrimSelectionView(container: .init(
      intent: intent as TrimSelectionIntent,
      state: intent.state,
      modelChangePublisher: intent.objectWillChange))
  }
}
struct TrimSelectionView_Previews: PreviewProvider {
  static var previews: some View {
    TrimSelectionView.build(intent: TrimSelectionIntent(initialState: .init(selectedTrim: nil, isSelectedTrim: false)))
  }
}

struct Trim: Identifiable, Equatable {
  static func == (lhs: Trim, rhs: Trim) -> Bool {
    return lhs.id == rhs.id
  }

  var id: UUID
  var name: String
  var description: String
  var price: CLPrice
  var imageURL: URL?
  var hmgData: [HMGDatum]

  static func mockTrim() -> Trim {
    return Trim(id: UUID(),
                name: "Le Blanc",
                description: "실용적인 사양의 경제적인 펠리세이드",
                price: CLPrice(40440000),
                hmgData: [HMGDatum(optionTitle: "안전 하차 보조", optionFrequency: 42), HMGDatum(optionTitle: "후측방 충돌\n경고", optionFrequency: 42),
                   HMGDatum(optionTitle: "후방 교차\n충돌방지 보조", optionFrequency: 42)])
  }
}
