//
//  HMGDataCard.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/11.
//

import SwiftUI

struct HMGDataCard: View {

  var options: [HMGDatum]

  var body: some View {

    VStack(alignment: .leading, spacing: 0) {
      Text("HMG Data")
        .catalogFont(type: .HeadENMedium10)
        .foregroundColor(.white)
        .frame(width: 70, height: 21)
        .background(Color.activeBlue)

      Spacer().frame(height: 12)

      Text(attributedString)
        .catalogFont(type: .TextKRMedium12)
        .frame(height: 16)

      Spacer().frame(height: 16)

      HStack(spacing: 36) {
        ForEach(0..<options.count) { idx in
          VStack(spacing: 4) {
            Text(options[idx].optionTitle)
              .catalogFont(type: .TextKRRegular10)
              .foregroundColor(Color.gray900)
              .frame(height: 36, alignment: .topLeading)

            Divider().frame(width: 60)

            Text("\(options[idx].optionFrequency)회")
              .catalogFont(type: .HeadKRRegular24)
              .foregroundColor(Color.gray900)
            Text("15,000km 당")
              .catalogFont(type: .TextKRRegular10)
              .foregroundColor(Color.gray600)

          }

        }
      }
      .frame(height: 94)
      Spacer().frame(height: 29)
    }
    .padding(.horizontal, 29)
    .background(
      Rectangle()
        .foregroundColor(Color.gray50)
        .frame(width: .infinity, height: 188)
    )

  }
}

struct HMGDataCard_Previews: PreviewProvider {
  static var previews: some View {
    HMGDataCard(options: [HMGDatum(optionTitle: "안전 하차 보조", optionFrequency: 42), HMGDatum(optionTitle: "후측방 충돌\n경고", optionFrequency: 42),
                          HMGDatum(optionTitle: "후방 교차\n충돌방지 보조", optionFrequency: 42)])
  }
}

extension HMGDataCard {
  @available(iOS 15, *)
  var attributedString: AttributedString {
    var text: AttributedString = "해당 트림에 포함된 옵션들의 실활용 데이터에요."
    guard let targetRange = text.range(of: "실활용 데이터") else { return "" }
    text.foregroundColor = Color.gray900
    text[targetRange].foregroundColor = Color.activeBlue
    return text
  }
}
