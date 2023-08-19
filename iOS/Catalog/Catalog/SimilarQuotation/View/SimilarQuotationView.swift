//
//  SimilarQuotationView.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/19.
//

import SwiftUI

extension SimilarQuotationView {
  @ViewBuilder
  static func build(intent: SimilarQuotationIntent, navitationIntent: CLNavigationIntentType) -> some View {

    SimilarQuotationView(container: .init(
      intent: intent as SimilarQuotationIntent,
      state: intent.state,
      modelChangePublisher: intent.objectWillChange), navigationIntent: navitationIntent)
  }
}

struct SimilarQuotationView {
  @StateObject var container: Container<SimilarQuotationIntentType, SimilarQuotationModel.State>
  var intent: SimilarQuotationIntentType { container.intent }
  var state: SimilarQuotationModel.State { intent.state }
  
  @SwiftUI.State var currentIndexBinding: Int = 0
  let budgetPrice: CLNumber = CLNumber(50000000)
  let quotation = Quotation.shared
  let navigationIntent: CLNavigationIntentType
  
}

extension SimilarQuotationView: View {
  
  var body: some View {
    NavigationView {
      VStack {
        SimilarQuotationTopBar(navigationIntent: navigationIntent)
        
        CLBudgetRangeView.build(intent:
            .init(initialState:
                .init(currentQuotationPrice: quotation.state.totalPrice, budgetPrice: budgetPrice,
                      status: .similarQuotation),
                  navigationIntent: navigationIntent))
        
        SnapCarousel(items: state.similarQuotations,
                     spacing: CGFloat(11).scaledWidth,
                     trailingSpace: CGFloat(11).scaledWidth,
                     index: $currentIndexBinding) { trim in
          GeometryReader { proxy in
            let size = proxy.size
            SimilarQuotationCard(intent: intent, index: currentIndexBinding, trimName: "Le Blanc")
          }
        }
       .frame(height: CGFloat(469).scaledHeight)
      }
    
    }
    .navigationBarBackButtonHidden()
    .ignoresSafeArea()
  }
}

struct SimilarQuotationView_Previews: PreviewProvider {
  static var previews: some View {
    let navigationIntent: CLNavigationIntentType = CLNavigationIntent(initialState: .init(currentPage: 5, showQuotationSummarySheet: true))
    
    SimilarQuotationView.build(intent: .init(initialState: .init(similarQuotations: [SimilarQuotation.mock(),
                                                                                     SimilarQuotation.mock(),
                                                                                     SimilarQuotation.mock()], selectedOption: [SimilarQuotationOption.mock(),
                                                                                                                                SimilarQuotationOption.mock()])), navitationIntent: navigationIntent)
  }
}
