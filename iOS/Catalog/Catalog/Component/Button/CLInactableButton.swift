//
//  CLInactableButton.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/10.
//

import SwiftUI

struct CLInActiceButton: View {

  @State var mainText: String

  var isInactive: Bool
  var subText: String?
  var inActiveText: String?
  var height: CGFloat
  var width: CGFloat?
  let buttonAction: () -> Void

}

extension CLInActiceButton {
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
              Text(isInactive ? mainText : (inActiveText ?? ""))
                .catalogFont(type: .HeadKRMedium16)
                .frame(maxWidth: width ?? .infinity, maxHeight: height)
            }
        }
        .buttonStyle(CLInActiveButtonStyle())
        .disabled(!isInactive)
    }
}
