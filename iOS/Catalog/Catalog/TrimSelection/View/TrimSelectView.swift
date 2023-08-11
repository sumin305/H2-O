//
//  TrimSelectView.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/11.
//

import SwiftUI

struct TrimSelectView: View {

  @State var isTrimSelected: Bool
  var body: some View {
    VStack {
      HStack {
        Text("트림을 선택해주세요.")
          .catalogFont(type: .HeadKRMedium18)
        Spacer()
      }
      .padding(.leading, 20)

      TrimScrollView(trims: [Trim(name: "Le Blanc",
                                  description: "실용적인 사양의 경제적인 펠리세이드",
                                  price: CLPrice(40440000),
                                  hmgData: [HMGDatum(optionTitle: "안전 하차 보조", optionFrequency: 42), HMGDatum(optionTitle: "후측방 충돌\n경고", optionFrequency: 42),
                                            HMGDatum(optionTitle: "후방 교차\n충돌방지 보조", optionFrequency: 42)]),
                             Trim(name: "Le Blanc",
                                  description: "실용적인 사양의 경제적인 펠리세이드",
                                  price: CLPrice(40440000),
                                  hmgData: [HMGDatum(optionTitle: "안전 하차 보조", optionFrequency: 42), HMGDatum(optionTitle: "후측방 충돌\n경고", optionFrequency: 42),
                                            HMGDatum(optionTitle: "후방 교차\n충돌방지 보조", optionFrequency: 42)]),
                             Trim(name: "Le Blanc",
                                  description: "실용적인 사양의 경제적인 펠리세이드",
                                  price: CLPrice(40440000),
                                  hmgData: [HMGDatum(optionTitle: "안전 하차 보조", optionFrequency: 42), HMGDatum(optionTitle: "후측방 충돌\n경고", optionFrequency: 42),
                                            HMGDatum(optionTitle: "후방 교차\n충돌방지 보조", optionFrequency: 42)]),
                             Trim(name: "Le Blanc",
                                  description: "실용적인 사양의 경제적인 펠리세이드",
                                  price: CLPrice(40440000),
                                  hmgData: [HMGDatum(optionTitle: "안전 하차 보조", optionFrequency: 42), HMGDatum(optionTitle: "후측방 충돌\n경고", optionFrequency: 42),
                                            HMGDatum(optionTitle: "후방 교차\n충돌방지 보조", optionFrequency: 42)])])
      CLInActiveButton(buttonState: $isTrimSelected, mainText: "Le Blanc 선택하기", height: 60, buttonAction: { print("선택하기") })

    }
  }
}

// struct TrimSelectView_Previews: PreviewProvider {
//  static var previews: some View {
//    TrimSelectView()
//  }
// }
