//
//  ContentView.swift
//  Catalog
//
//  Created by Jung peter on 8/1/23.
//

import SwiftUI

struct ContentView: View {
    @State var showPopUp: Bool = true
    @State var showQuotationSummarySheet: Bool = false
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                CLNavigationView.build(intent: CLNavigationIntent(initialState: .init(currentPage: 0)))
                CLQuotationPriceBar(showQuotationSummarySheet:
                                        $showQuotationSummarySheet,
                                    currentQuotationPrice: .constant(CLPrice(41500000)), buttonText: "견적 요약")
                CLDualChoiceButton(leftText: "이전", rightText: "다음", height: 52, leftAction: { print("이전 버튼 클릭") }, rightAction: { print("다음 버튼 클릭") })
            }
            .sheet(isPresented: $showQuotationSummarySheet) {
                CLQuotationSummarySheet(quotation: CarQuotation(), showQuotationSummarySheet: $showQuotationSummarySheet)
            }
            .padding(.bottom, 0.1)
            if showPopUp {
              EntryGuide()
            }

            if showQuotationSummarySheet {
                DimmedZStack {}
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
