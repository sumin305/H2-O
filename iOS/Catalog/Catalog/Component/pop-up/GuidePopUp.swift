//
//  GuidePopUp.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/03.
//

import SwiftUI

struct GuidePopUp: View {
    @Binding var showPopUp: Bool
    let rectangleImage: String
    
    let width: CGFloat
    let height: CGFloat
    let title: String
    let description: String
    
    var body: some View {
        ZStack {
            Color("dimBackground").opacity(0.5).ignoresSafeArea()
            Image(rectangleImage)
            VStack {
                ZStack(alignment: .top) {
                    HStack(alignment: .top) {
                        Text(title).catalogFont(type: .HeadKRMedium14).foregroundColor(.gray900
                        )
                        Spacer()
                    }
                    HStack(alignment: .top) {
                        Spacer()
                        Button {
                            showPopUp = false
                        } label: {
                            Image("24px icon")
                        }
                    }
                }
                HStack {
                    Divider().frame(width: 36, height: 1).background(Color.primary200)
                    Spacer()
                }
                Text(description).catalogFont(type: .TextKRRegular12).foregroundColor(Color.primary500)
            }.frame(maxWidth: width).padding(.vertical, 0.5)
        }
    }
}

struct GuidePopUp_Previews: PreviewProvider {
    static var previews: some View {
        @State var showPopUp: Bool = true
        GuidePopUp(showPopUp: $showPopUp,
                   rectangleImage: "Rectangle 830252",
                   width: 214,
                   height: 236,
                   title: "현대자동차만이\n제공하는 실활용 데이터로\n합리적인 차량을 만들어 보세요.",
                   description: "HMG Data 마크는 Hyundai Motor Group\n에서만 제공하는 데이터입니다.\n주행 중 운전자들이 실제로 얼마나 활용하는지를\n 추적해 수치화한 데이터 입니다.")
    }
}
