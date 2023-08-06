//
//  GuidePopUpView.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/05.
//


import SwiftUI

struct CLGuidePopUpView: View {
    @Binding var showPopUp: Bool
    let rectangleImage: String
    let width: CGFloat
    let height: CGFloat
    let title: AttributedString
    var accentText: String?
    let description: String
    var body: some View {
        ZStack {
            Color("dimBackground").ignoresSafeArea()
            Spacer(minLength: 100)
            CLGuidePopUp(showPopUp: $showPopUp,
                    rectangleImage: rectangleImage,
                    width: width,
                    height: height,
                    title: title,
                    accentText: accentText,
                    description: description)
            Spacer(minLength: 300)
        }
    }
}

struct CLGuidePopUpView_Previews: PreviewProvider {
    static var previews: some View {
        @State var showPopUp: Bool = true
        CLGuidePopUpView(showPopUp: $showPopUp,
                   rectangleImage: "Rectangle 830252",
                   width: 214,
                   height: 236,
                   title: "현대자동차만이\n제공하는 실활용 데이터로\n합리적인 차량을 만들어 보세요.",
                   accentText: "실활용 데이터",
                   description: "HMG Data 마크는 Hyundai Motor Group\n에서만 제공하는 데이터입니다.\n주행 중 운전자들이 실제로 얼마나 활용하는지를\n 추적해 수치화한 데이터 입니다.")
    }
}
