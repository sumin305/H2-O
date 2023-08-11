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
      }
    }
}

struct TrimSelectView_Previews: PreviewProvider {
    static var previews: some View {
        TrimSelectView()
    }
}
