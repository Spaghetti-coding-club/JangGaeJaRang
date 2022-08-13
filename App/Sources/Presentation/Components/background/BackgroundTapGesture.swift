import SwiftUI

struct BackgroundTapGesture<Content: View>: View {
  private var content: Content
  
  init(@ViewBuilder content: @escaping () -> Content) {
    self.content = content()
  }
  
  var body: some View {
    Color.background
      .overlay(content)
  }
}
