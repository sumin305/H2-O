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
          HStack {
            Button {
              navigationIntent.send(action: .onTapSimilarQuotationBackButton)
            } label: {
              Image("arrow_left")
            }
            Spacer().frame(width: 117)
            Text("유사견적").catalogFont(type: .HeadKRMedium18)
            Spacer().frame(width: 156)
          }
          .padding(.top, 54)
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
