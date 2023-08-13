//
//  CLInactableButton.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/10.
//

import SwiftUI

struct CLInActiveButton: View {

  @Binding var isTrimSelected: Bool
  var subText: String?
  var mainText: String
  var inActiveText: String?
  var height: CGFloat
  var width: CGFloat?
  let buttonAction: () -> Void

}

extension CLInActiveButton {
    var body: some View {
        Button {
            buttonAction()
        } label: {
            VStack {
                if subText != nil {
                    Text(subText ?? "")
                        .catalogFont(type: .TextKRRegular12)
                        .foregroundColor(Color.white)
                }
              Text(isTrimSelected ? mainText : (inActiveText ?? ""))
                    .catalogFont(type: .HeadKRMedium16)
                    .foregroundColor(Color.white)
            }
            .frame(maxWidth: width ?? .infinity, maxHeight: height)
            .background(isTrimSelected ? Color.gray300 : Color.primary700)
            .ignoresSafeArea()
        }
        .disabled(isTrimSelected)
        .buttonStyle(.plain)
    }
}
