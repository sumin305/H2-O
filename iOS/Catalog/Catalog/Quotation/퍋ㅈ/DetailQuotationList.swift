//
//  DetailQuotationList.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/17.
//

import SwiftUI

struct DetailQuotationList: View {
  var quotation: SummaryCarQuotation
  var body: some View {
    LazyVStack(pinnedViews: .sectionHeaders) {
      Section(header: DetailQuotationTitle(title: "모델타입")) {
        VStack {
          ForEach([quotation.powertrain, quotation.bodytype, quotation.drivetrain], id: \.self) { modeltype in
            DetailQuotationItem(info: modeltype)
          }
        }
      }
      Section(header: DetailQuotationTitle(title: "색상")) {
        VStack {
          ForEach([quotation.externalColor, quotation.internalColor], id: \.self) { color in
            DetailQuotationItem(info: color)
          }
        }
      }
      Section(header: DetailQuotationTitle(title: "추가옵션")) {
        VStack {
          ForEach(quotation.options, id: \.self) { option in
            DetailQuotationItem(info: option)
          }
        }
      }
      Section(header: DetailQuotationTitle(title: "탁송")) { }
      Section(header: DetailQuotationTitle(title: "할인 및 포인트")) { }
      Section(header: DetailQuotationTitle(title: "면세 구분 및 등록비")) { }
      Section(header: DetailQuotationTitle(title: "결제수단")) { }
      Section(header: DetailQuotationTitle(title: "안내사항")) { }

    }
  }
}
