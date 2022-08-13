import SwiftUI

/// TextView의 isFocused(TextView 커서가 활성 중인지) 속성을 가져오기 위해 UITextViewRepresentable를 사용함
struct UITextViewRepresentable: UIViewRepresentable {
  @Binding var text: String
  @Binding var isFocused: Bool
  let textLimit: Int

  func makeUIView(context: UIViewRepresentableContext<UITextViewRepresentable>) -> UITextView {
    let textView = UITextView(frame: .zero)
    textView.backgroundColor = .clear
    textView.font = UIFont.systemFont(ofSize: 16.0)
    textView.delegate = context.coordinator

    return textView
  }

  func updateUIView(_ uiView: UITextView, context: UIViewRepresentableContext<UITextViewRepresentable>) {
    /// 내부에서 글자를 limit 이상으로 내보내지 않음
    if uiView.text.count >= textLimit {
      uiView.text = String(self.text.prefix(textLimit))
    }
  }

  func makeCoordinator() -> UITextViewRepresentable.Coordinator {
    Coordinator(text: self.$text, isFocused: self.$isFocused)
  }

  class Coordinator: NSObject, UITextViewDelegate {
    @Binding var text: String
    @Binding var isFocused: Bool

    init(text: Binding<String>, isFocused: Binding<Bool>) {
      self._text = text
      self._isFocused = isFocused
    }

    func textViewDidEndEditing(_ textView: UITextView) {
      self.isFocused = false
    }

    func textViewDidBeginEditing(_ textView: UITextView) {
      self.isFocused = true
    }

    func textViewDidChange(_ textView: UITextView) {
      self.text = textView.text ?? ""
    }
  }
}
