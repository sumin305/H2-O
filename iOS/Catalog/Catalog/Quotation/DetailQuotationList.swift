//
//  DetailQuotationList.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/17.
//

 import SwiftUI

 struct DetailQuotationList: View {
  var quotation: SummaryCarQuotation
  @State var modeltypeFloating = true
  @State var colorFloating = false
  @State var optionFloating = false

  var body: some View {
    LazyVStack(pinnedViews: .sectionHeaders) {
      Section(header: DetailQuotationTitle(title: "모델타입", isFloating: $modeltypeFloating)) {
        if modeltypeFloating {
          VStack {
            ForEach([quotation.powertrain, quotation.bodytype, quotation.drivetrain], id: \.self) { modeltype in
              DetailQuotationItem(info: modeltype)
            }
          }
        }
      }
      Section(header: DetailQuotationTitle(title: "색상", isFloating: $colorFloating)) {
        if colorFloating {
          VStack {
            ForEach([quotation.externalColor, quotation.internalColor], id: \.self) { color in
              DetailQuotationItem(info: color)
            }
          }
        }
      }
      Section(header: DetailQuotationTitle(title: "추가옵션", isFloating: $optionFloating)) {
        if optionFloating {
          VStack {
            ForEach([SummaryQuotationInfo(title: "옵션", name: "nn", price: CLNumber(500)),
                     SummaryQuotationInfo(title: "옵션", name: "nn", price: CLNumber(500)),
                     SummaryQuotationInfo(title: "옵션", name: "nn", price: CLNumber(500))], id: \.self) { option in
              DetailQuotationItem(info: option)
            }
          }
        }
      }
      Section(header: MockDetailQuotationTitle(title: "탁송")) { }
      Section(header: MockDetailQuotationTitle(title: "할인 및 포인트")) { }
      Section(header: MockDetailQuotationTitle(title: "면세 구분 및 등록비")) { }
      Section(header: MockDetailQuotationTitle(title: "결제수단")) { }
      Section(header: MockDetailQuotationTitle(title: "안내사항")) { }
    }
  }
 }
