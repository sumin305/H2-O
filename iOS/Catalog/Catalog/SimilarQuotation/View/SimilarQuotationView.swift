//
//  SimilarQuotationView.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/19.
//

import SwiftUI

struct SimilarQuotationView {
  let budgetPrice: CLNumber = CLNumber(50000000)
  let quotation = Quotation.shared
  let navigationIntent: CLNavigationIntentType
}

extension SimilarQuotationView: View {
  
  var body: some View {
    NavigationView {
      VStack {
        ZStack {
          HStack {
            Button {
              navigationIntent.send(action: .onTapSimilarQuotationBackButton)
            } label: {
              Image("arrow_left")
            }
            Spacer()
          }
          HStack(alignment: .center) {
            Text("유사견적").catalogFont(type: .HeadKRMedium18)
          }
        }
        .padding(.top, 32)
        .padding(.horizontal, 16)
        
        
        CLBudgetRangeView.build(intent:
            .init(initialState:
                .init(currentQuotationPrice: quotation.state.totalPrice, budgetPrice: budgetPrice,
                      status: .similarQuotation),
                  navigationIntent: navigationIntent))
      }
    }
    .navigationBarBackButtonHidden()
    .ignoresSafeArea()
  }
}

struct SimilarQuotationView_Previews: PreviewProvider {
  static var previews: some View {
    let navigationIntent: CLNavigationIntentType = CLNavigationIntent(initialState: .init(currentPage: 5, showQuotationSummarySheet: true))
    
    
    SimilarQuotationView(navigationIntent: navigationIntent)
  }
}