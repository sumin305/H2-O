//
//  CLInactableButton.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/10.
//

import SwiftUI

struct CLInActiveButton: View {

    enum CLButtonState {
        case active
        case inActive
    }

    @Binding var buttonState: CLButtonState
    var subText: String?
    var mainText: String
    var inActiveText: String?
    var height: CGFloat
    var width: CGFloat?
    let buttonAction: () -> Void

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
              Text(buttonState == .active ? mainText : (inActiveText ?? ""))
                    .catalogFont(type: .HeadKRMedium16)
                    .foregroundColor(Color.white)
            }
            .frame(maxWidth: width ?? .infinity, maxHeight: height)
            .background(buttonState == .inActive ? Color.gray300 : Color.primary700)
            .ignoresSafeArea()
        }
        .disabled(buttonState == .inActive)
        .buttonStyle(.plain)
    }
}
