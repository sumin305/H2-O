//
//  HelpIcon.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/23.
//

import SwiftUI

struct HelpIcon: View {
  @Binding var showHelp: Bool 
  var body: some View {
      VStack(alignment: .trailing) {
        HStack(alignment: .top, spacing: 0) {
          Spacer()
          Button {
            showHelp.toggle()
          } label: {
            Image("help").frame(width: 24, height: 24)
          }
        }
        Spacer()
      }
      .padding(.top, 32)
      .padding(.horizontal, 16)
    }
}

