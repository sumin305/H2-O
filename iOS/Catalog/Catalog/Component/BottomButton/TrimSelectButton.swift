//
//  TrimSelectButton.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/02.
//

import SwiftUI

struct TrimSelectButton: View {
    // 초기 상태는 false/ false
    // 다시 돌아왔을 때는 true/ false
    @State var isTrimSelected = true
    @State var isButtonClicked = false
    @State var trimName = "Le Blanc"
    var body: some View {
            Button {
                isButtonClicked = true
            } label: {
                Text(isTrimSelected ? "\(trimName) 선택하기" : "옵션을 선택해 추가해보세요.")
                    .catalogFont(type: .HeadKRMedium16)
                    .frame(maxWidth: .infinity, maxHeight: 60)
                    .foregroundColor(Color.gray50)
                    .background(isTrimSelected ?
                                (isButtonClicked ? Color.primary800 : Color.primary700) : Color.gray300)
            }.disabled(!isTrimSelected)
             .ignoresSafeArea()
    }
}

struct TrimSelectButton_Previews: PreviewProvider {
    static var previews: some View {
        TrimSelectButton()
    }
}
