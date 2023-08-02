//
//  TrimSelectButton.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/02.
//

import SwiftUI

struct OneBottomButtonView: View {
    @State var subText: String?
    @State var mainText: String
    @State var inActiveText: String?
    @State var height: CGFloat
    @State var width: CGFloat?
    @State var isClicked: Bool
    @State var isActive: Bool?
    var body: some View {
        Button {
            isClicked = true
        } label: {
            VStack {
                if subText != nil {
                    Text(subText ?? "")
                        .catalogFont(type: .TextKRRegular12)
                        .foregroundColor(Color.white)
                }
                Text((isActive == nil || isActive!) ? mainText : (inActiveText ?? ""))
                    .catalogFont(type: .HeadKRMedium16)
                    .foregroundColor(Color.white)
            }
            .frame(maxWidth: width ?? .infinity, maxHeight: height)
            .background(isClicked ?
                        Color.primary800 : (isActive != nil && !(isActive!) ? Color.gray300 : Color.primary700))
            .disabled(!(isActive ?? true))
            .ignoresSafeArea()
        }
    }
}

struct OneBottomButtonView_Previews: PreviewProvider {
    static var previews: some View {
        OneBottomButtonView(mainText: "Le Blanc 선택하기", inActiveText: "옵션을 선택해 추가해보세요.", height: 52, isClicked: false, isActive: false)
    }
}
