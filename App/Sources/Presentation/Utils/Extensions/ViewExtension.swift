import SwiftUI

extension View {
  func padding(_ top: CGFloat, _ leading: CGFloat, _ trailing: CGFloat, _ bottom: CGFloat) -> some View {
    modifier(PaddingModifier(top: top, leading: leading, trailing: trailing, bottom: bottom))
  }
  
  func fillWidth() -> some View {
    modifier(FillWidthModifier(alignment: .center))
  }
  
  func fillWidth(_ textAlignment: TextAlignment) -> some View {
    modifier(FillWidthTextModifier(textAlign: textAlignment))
  }
  
  func fillHeight() -> some View {
    modifier(FillHeightModifier())
  }
  
  /// margin: 뷰를 스크린 가운데에 배치했을 때, 뷰 (왼/오)가장자리와 스크린 (왼/오)가장자리 사이의 간격.
  /// screenWidthMargin(7) = 스크린 너비가 414일 때, 뷰 너비는 400(414 - 7*2)으로 설정된다
  func screenWidthMargin(_ margin: CGFloat) -> some View {
    modifier(ScreenWidthModifier(horizontalMargin: margin))
  }
  
  func fontSize(_ size: CGFloat) -> some View {
    modifier(FontSizeModifier(size: size))
  }
  
  func hideKeyboard() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
  }
  
  func onLoad(perform action: (() -> Void)? = nil) -> some View {
    modifier(ViewDidLoadModifier(perform: action))
  }
  
  func textStyle(_ size: CGFloat, _ weight: Font.Weight, _ color: Color = .compBlue) -> some View {
    modifier(TextStyleModifier(color: color, size: size, weight: weight))
  }
}
