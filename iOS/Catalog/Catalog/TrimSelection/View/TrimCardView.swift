//
//  TrimCardView.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/11.
//

import SwiftUI

struct TrimCardView: View {

    var trim: Trim

    var body: some View {
      VStack(alignment: .leading, spacing: 0) {

        VStack(alignment: .leading, spacing: 0) {
          Text(trim.description)
            .catalogFont(type: .TextKRRegular14)
            .foregroundColor(Color.gray900)
            .padding(.top, 20)
          Text(trim.name)
            .catalogFont(type: .HeadKRBold26)
            .foregroundColor(Color.primary0)
          Spacer().frame(height: 12)
          Text(trim.price.spacingDescription)
            .catalogFont(type: .HeadKRMedium18)
            .foregroundColor(Color.primary)
            .padding(.bottom, 8)

        }
        .frame(width: 312, height: 127)

        HStack {
          Spacer()
          Image("trim_select_image")
            .resizable()
            .frame(width: 263, height: 197)
        }

        HMGDataCard(options: trim.hmgData)
      }
      .frame(width: 312, height: 512)
      .padding(.top, 12)
      .border(Color.skyBlue, width: 1)
    }

}

struct TrimCardView_Previews: PreviewProvider {
    static var previews: some View {
      TrimCardView(trim: Trim(name: "Le Blanc",
                              description: "실용적인 사양의 경제적인 펠리세이드",
                              price: CLPrice(40440000),
                              hmgData: [HMGDatum(optionTitle: "안전 하차 보조", optionFrequency: 42), HMGDatum(optionTitle: "후측방 충돌\n경고", optionFrequency: 42),
                                        HMGDatum(optionTitle: "후방 교차\n충돌방지 보조", optionFrequency: 42)]))
    }
}

struct Trim {
  var name: String
  var description: String
  var price: CLPrice
  var imageURL: URL?
  var hmgData: [HMGDatum]
}
