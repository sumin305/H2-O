//
//  TrimScrollView.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/12.
//

import SwiftUI

struct SnapCarousel<Content: View, T>: View {

  var content: Content
  var items: [T]

  var body: some View {
    ScrollView(.horizontal) {
      HStack {
        ForEach(0..<trims.count) { trimIndex in
          TrimCardView(trim: trims[trimIndex])
        }
      }
    }
  }
}

struct TrimScrollView_Previews: PreviewProvider {
  static var previews: some View {
    TrimScrollView(trims:
                    [Trim(name: "Le Blanc",
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
  }
}
