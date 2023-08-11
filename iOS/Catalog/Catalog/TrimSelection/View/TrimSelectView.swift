//
//  TrimSelectView.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/11.
//

import SwiftUI

struct TrimSelectView: View {
    var body: some View {
      VStack {
        HStack {
          Text("트림을 선택해주세요.")
            .catalogFont(type: .HeadKRMedium18)
          Spacer()
        }
        .padding(.leading, 20)

        ScrollView(.horizontal, showsIndicators: false) {
          HStack {
            TrimCardView(trim: Trim(name: "Le Blanc",
                                    description: "실용적인 사양의 경제적인 펠리세이드",
                                    price: CLPrice(40440000),
                                    hmgData: [HMGDatum(optionTitle: "안전 하차 보조", optionFrequency: 42), HMGDatum(optionTitle: "후측방 충돌\n경고", optionFrequency: 42),
                                              HMGDatum(optionTitle: "후방 교차\n충돌방지 보조", optionFrequency: 42)]))
            .shadow(color: Color("ShadowColor"), radius: 2)
            .padding(.leading, 32)
            .padding(.trailing, 16)
            TrimCardView(trim: Trim(name: "Le Blanc",
                                    description: "실용적인 사양의 경제적인 펠리세이드",
                                    price: CLPrice(40440000),
                                    hmgData: [HMGDatum(optionTitle: "안전 하차 보조", optionFrequency: 42), HMGDatum(optionTitle: "후측방 충돌\n경고", optionFrequency: 42),
                                              HMGDatum(optionTitle: "후방 교차\n충돌방지 보조", optionFrequency: 42)]))
            .shadow(color: Color("ShadowColor"), radius: 2)
            .padding(.trailing, 16)
            TrimCardView(trim: Trim(name: "Le Blanc",
                                    description: "실용적인 사양의 경제적인 펠리세이드",
                                    price: CLPrice(40440000),
                                    hmgData: [HMGDatum(optionTitle: "안전 하차 보조", optionFrequency: 42), HMGDatum(optionTitle: "후측방 충돌\n경고", optionFrequency: 42),
                                              HMGDatum(optionTitle: "후방 교차\n충돌방지 보조", optionFrequency: 42)]))
            .shadow(color: Color("ShadowColor"), radius: 2)
            .padding(.trailing, 16)
          }
        }
      }
    }
}

struct TrimSelectView_Previews: PreviewProvider {
    static var previews: some View {
        TrimSelectView()
    }
}
