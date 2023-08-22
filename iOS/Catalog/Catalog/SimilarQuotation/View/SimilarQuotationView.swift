//
//  SimilarQuotationView.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/19.
//

import SwiftUI

struct SimilarQuotationView {
  @StateObject var container: Container<SimilarQuotationIntentType, SimilarQuotationModel.State>
  var intent: SimilarQuotationIntentType { container.intent }
  var state: SimilarQuotationModel.State { intent.state }
  
  @SwiftUI.State var showHelp: Bool = false
  @SwiftUI.State var showAlert: Bool = false
  @SwiftUI.State var currentIndex: Int = 0 {
    didSet(index) {
      intent.send(action: .currentSimilarQuotationIndexChanged(index: index))
    }
  }
  let budgetPrice: CLNumber = CLNumber(50000000)
  let quotation = Quotation.shared
  let navigationIntent: CLNavigationIntentType
}

extension SimilarQuotationView {
  enum AlertCase {
    case noOption
    case optionButQuit
    case addOption
  }
}

extension SimilarQuotationView: View {
  
  var body: some View {
    
    NavigationView {
      ZStack {
        VStack {
          SimilarQuotationTopBar(showAlert: $showAlert, intent: intent)
          
          CLBudgetRangeView.build(intent:
              .init(initialState:
                  .init(currentQuotationPrice: quotation.state.totalPrice,
                        budgetPrice: budgetPrice,
                        status: .similarQuotation),
                    navigationIntent: navigationIntent))
          
          SnapCarousel(items: state.similarQuotations,
                       spacing: CGFloat(12).scaledWidth,
                       trailingSpace: CGFloat(24).scaledWidth,
                       index: $currentIndex) { similarQuotation in
            GeometryReader { proxy in
              let size = proxy.size
              SimilarQuotationCard(index: 0,
                                   similarQuotation: similarQuotation,
                                   intent: intent,
                                   state: state,
                                   trimName: "Le Blanc")
              .frame(width: size.width, height: size.height)
            }
          }
                       .frame(height: CGFloat(449).scaledHeight)
          
          
          ScrollIndicator(spacing: 10,
                          count: state.similarQuotations.count,
                          bigWidth: 15,
                          smallWidth: 5,
                          height: 5,
                          bigScaleEffect: 1.4,
                          smallScaleEffect: 1,
                          bottomPadding: 12,
                          currentIndex: $currentIndex)
    
          CLInActiceButton(mainText: "내 견적서에 추가하기",
                           subText: "선택된 옵션\(state.selectedOptions.count)개",
                           inActiveText: "옵션을 선택해 추가해보세요.",
                           height: CGFloat(52).scaledHeight,
                           buttonAction: {
            showAlert = true
            intent.send(action: .onTapAddButton)           })
          .disabled(state.selectedOptions.isEmpty)
        }
        .padding([.top, .bottom], 1)
        
        
        // Dimmed 도움말
        if showHelp {
          SimilarQuotationHelpView()
        }
        
        // 도움말 버튼
        HelpIcon(showHelp: $showHelp)
        
        // 경고창
        if showAlert {
          switch state.alertCase {
            case .noOption:
              noOptionAlertView()
              
            case .optionButQuit:
              optionButQuitAlertView()
              
            case .addOption:
              addOptionAlertView()
          }
        }
      }
      //TODO: - Quotation 받아오는 방식 변경하기
      .onAppear { intent.send(action: .onAppear(quotation: quotation.state.quotation!)) }
      
    }
    .navigationBarBackButtonHidden()
  }
  
}


extension SimilarQuotationView {
  @ViewBuilder
  static func build(intent: SimilarQuotationIntent, navitationIntent: CLNavigationIntentType) -> some View {
    
    SimilarQuotationView(container: .init(
      intent: intent as SimilarQuotationIntent,
      state: intent.state,
      modelChangePublisher: intent.objectWillChange), navigationIntent: navitationIntent)
  }
}

fileprivate extension SimilarQuotationView {
  func toAlertString(optionName: String, count: Int) -> String {
    "[\(optionName)]외 \(count)개"
  }
  
  func noOptionAlertView() -> some View {
    let buttonContent = ButtonContent(cancelAction: {
      showAlert = false
    }, submitAction: {
      intent.send(action: .choiceQuit)
    }, submitText: "종료")
    return CLAlertView<CLQuitAlertContentView, ButtonContent, AlertDoubleButton>(items: buttonContent) { item in
      AlertDoubleButton(cancelAction: item.cancelAction, submitAction: item.submitAction, cancelText: item.cancelText, submitText: item.submitText)
    }
  }
  
  func optionButQuitAlertView() -> some View {
    let buttonContent = ButtonContent(cancelAction: {
      showAlert = false
    }, submitAction: {
      intent.send(action: .choiceQuit)
    })
    return CLAlertView<CLOptionQuitAlertContentView, ButtonContent, AlertDoubleButton>(info: String(state.selectedOptions.count), items: buttonContent) { item in
      AlertDoubleButton(cancelAction: item.cancelAction, submitAction: item.submitAction, cancelText: item.cancelText, submitText: item.submitText)
    }
  }
  
  func addOptionAlertView() -> some View {
    let buttonContent = ButtonContent(cancelAction: {
      showAlert = false
    }, submitAction: {
      intent.send(action: .choiceQuit)
    })
    return CLAlertView<CLOptionSelectAlertContentView, ButtonContent, AlertSingleButton>(info: toAlertString(optionName: state.selectedOptions[0].name, count: state.selectedOptions.count), items: buttonContent) { item in
      AlertSingleButton(cancelAction: item.cancelAction, submitAction: item.submitAction, cancelText: item.cancelText, submitText: item.submitText)
    }
  }
}
