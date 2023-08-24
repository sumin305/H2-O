//
//  ExternalImageView.swift
//  Catalog
//
//  Created by 이수민 on 2023/08/24.
//

import SwiftUI
struct ExteriorImageView {
  var intent: ExteriorSelectionIntentType
  var state: ExteriorSelectionModel.State
  @SwiftUI.State var currentIndex: Int = 0
  let imageCacher = ImageCacheService.shared
}

extension ExteriorImageView: View {
  var body: some View {
    GeometryReader { proxy in
      VStack {
        Spacer()
        if state.colors.isEmpty {
          EmptyView()
        } else {
          AsyncCachedImage(url: state.colors[state.colors.firstIndex(where: {$0.isSelected}) ?? 0].color.exteriorImages[currentIndex]) { image in
            image
              .resizable()
              .frame(height: CGFloat(198).scaledHeight, alignment: .bottom)
          }
          .gesture(
            DragGesture()
              .onChanged { drag in
                let count = state.colors[state.colors.firstIndex(where: {$0.isSelected}) ?? 0].color.exteriorImages.count
                // 왼쪽으로 스크롤
                if drag.translation.width < 0 {
                  currentIndex += 1
                  if currentIndex > count - 1 {
                    currentIndex = 0
                  }
                }
                // 오른쪽으로 스크롤
                else {
                  currentIndex -= 1
                  if currentIndex < 0 {
                    currentIndex = count - 1
                  }
                }
                print(currentIndex)
                print(state.colors[state.colors.firstIndex(where: {$0.isSelected}) ?? 0].color.exteriorImages[currentIndex])
              }
          )
        }
      }
    }
  }
}

//struct ExternalImageView_Previews: PreviewProvider {
//  static var previews: some View {
//    ExternalImageView(intent: ExternalSelectionIntent(initialState: .init(selectedTrimId: 2),
//                                                      repository: ExteriorColorRepository(
//                                                        requestManager: RequestManager(
//                                                          apiManager: ExteriorColorAPIManager()))))
//  }
//}


//GeometryReader { proxy in
//  AsyncCachedImage(url: quotation.state.quotation?.trim.internalImage) { img in
//    img
//      .offset(x: offset)
//      .gesture(
//        DragGesture()
//          .onChanged { drag inag
//            let nextOffset = offset + (drag.translation.width * 0.1)
//            if abs(nextOffset) < imageHalfWidth {
//              offset = nextOffset
//            }
//          }
//      )
//  }
//  .frame(minWidth: proxy.size.width, maxHeight: proxy.size.height)
//}
