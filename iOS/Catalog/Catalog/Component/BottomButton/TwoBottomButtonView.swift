//
//  TwoBottomButtonView.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/03.
//

import SwiftUI

struct TwoBottomButtonView: View {
    @State var leftText: String
    @State var rightText: String
    @State var height: CGFloat
    @State var width: CGFloat?
    @State var isLeftClicked: Bool
    var body: some View {
        HStack(spacing: 0) {
            Button {
                isLeftClicked = true
            } label: {
                twoBottomButtonLabel(text: leftText, width: width, height: height, backGroundColor: Color.gray300)
            }
            Button {
                isLeftClicked = false
            } label: {
                twoBottomButtonLabel(text: rightText, width: width, height: height, backGroundColor: Color.primary700)
            }
        }
    }
}

struct TwoBottomButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TwoBottomButtonView(leftText: "취소", rightText: "완료", height: 52, isLeftClicked: false)
    }
}

extension TwoBottomButtonView {
    func twoBottomButtonLabel(text: String, width: CGFloat?, height: CGFloat, backGroundColor: Color) -> some View {
        return Text(text)
            .catalogFont(type: .HeadKRMedium16)
            .frame(maxWidth: width == nil ? .infinity / 2 : (width ?? 0) / 2, minHeight: height)
            .background(backGroundColor)
            .foregroundColor(Color.white)
    }
}
