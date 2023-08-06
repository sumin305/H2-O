//
//  ContentView.swift
//  Catalog
//
//  Created by Jung peter on 8/1/23.
//

import SwiftUI
struct ContentView: View {
    @State var buttonState: CLButtonState = .default
    @State var showPopUp = true
    var body: some View {
        ZStack {
            VStack {
                Image("logo")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!").catalogFont(type: .HeadENBold26)
                
                CLButton(buttonState: $buttonState,
                         mainText: "Le Blanc 선택하기",
                         inActiveText: "옵션을 선택해 추가해보세요.",
                         height: 52, buttonAction: { print("clicked") })
                CLDualChoiceButton(leftText: "취소",
                                   rightText: "완료",
                                   height: 52,
                                   leftAction: { print("left")},
                                   rightAction: { print("right")})
                
            }
            if showPopUp {
                CLGuidePopUpView(showPopUp: $showPopUp,
                           rectangleImage: "Rectangle 830252",
                           width: 214,
                           height: 236,
                           title: "현대자동차만이\n제공하는 실활용 데이터로\n합리적인 차량을 만들어 보세요.",
                        accentText: "실활용 데이터"
                           description: "HMG Data 마크는 Hyundai Motor Group\n에서만 제공하는 데이터입니다.\n주행 중 운전자들이 실제로 얼마나 활용하는지를\n 추적해 수치화한 데이터 입니다.")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
