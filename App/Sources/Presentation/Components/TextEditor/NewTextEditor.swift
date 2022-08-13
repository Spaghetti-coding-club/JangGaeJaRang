import SwiftUI

struct NewTextEditor: View {

  @Binding var text: String
  @State private var isFocused = false

  let placeholder: String
  var showPlaceholder: Bool {
    !isFocused && text.isEmpty
  }

  var body: some View {
    ZStack(alignment: .bottomTrailing) {

      VStack {
        if showPlaceholder {
          Text(placeholder)
            .foregroundColor(.secondary)
            .fillWidth(.leading)
        }

        Spacer()
      }

      UITextViewRepresentable(text: $text, isFocused: $isFocused, textLimit: 300)
        .background(.clear)
    }
  }
}
