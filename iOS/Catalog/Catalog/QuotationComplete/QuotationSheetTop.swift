//
//  QuotationSheetTop.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/17.
//

import SwiftUI

struct QuotationSheetTop: View {
    var body: some View {
      VStack {
        Capsule()
          .fill(Color.gray300)
          .frame(width: 39, height: 4)
          .padding(.bottom, 5)
          .padding(.top, 5)
      }
      .frame(maxWidth: .infinity, maxHeight: 30)
      .background(
        RoundedRectangle(cornerRadius: 20)
          .fill(.white)
          .shadow(radius: 1, x: 0, y: -1)
      )
    }
}

struct QuotationSheetTop_Previews: PreviewProvider {
    static var previews: some View {
        QuotationSheetTop()
    }
}
