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

      TrimScrollView(trims: [Trim.mockTrim(), Trim.mockTrim(), Trim.mockTrim(), Trim.mockTrim()])
      CLInActiveButton(isTrimSelected: isTrimSelectedBinding,
                       mainText: "Le Blanc 선택하기",
                       inActiveText: "옵션을 선택해 추가해보세요.",
                       height: 60,
                       buttonAction: { print("선택하기") })
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
// struct TrimSelectView_Previews: PreviewProvider {
//  static var previews: some View {
//    TrimSelectView()
//  }
// }


struct Trim {

  var name: String
  var description: String
  var price: CLPrice
  var imageURL: URL?
  var hmgData: [HMGDatum]
  
  static func mockTrim() -> Trim {
     return Trim(name: "Le Blanc",
         description: "실용적인 사양의 경제적인 펠리세이드",
         price: CLPrice(40440000),
         hmgData: [HMGDatum(optionTitle: "안전 하차 보조", optionFrequency: 42), HMGDatum(optionTitle: "후측방 충돌\n경고", optionFrequency: 42),
                   HMGDatum(optionTitle: "후방 교차\n충돌방지 보조", optionFrequency: 42)
  }
}
