import SwiftUI
import UIKit

struct PageIndicator: UIViewRepresentable {
 @Binding var currentPage: Int
 var numberOfpages: Int
 func makeUIView(context: Context) -> some UIView {
  let control = UIPageControl()
  control.numberOfPages = 1
  control.currentPageIndicatorTintColor = .black
  control.pageIndicatorTintColor = .gray
  control.translatesAutoresizingMaskIntoConstraints = false
  control.setContentHuggingPriority(.required, for: .horizontal)
  return control
 }
 func updateUIView(_ uiView: UIViewType, context: Context) {
  guard let control = uiView as? UIPageControl else { return }
  control.currentPage = currentPage
  control.numberOfPages = numberOfpages
 }
}

@ViewBuilder
 private var pageControl: some View {
  HStack {
   PageIndicator(currentPage: $page, numberOfpages: 2)
  }
 }
