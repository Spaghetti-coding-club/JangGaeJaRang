import SwiftUI

struct MainButton: View {
    var text: String
    var style: Style = .enabled
    var action: () -> Void

    init(
        text: String = "",
        style: Style = .enabled,
        action: @escaping () -> Void = {}
    ) {
        self.text = text
        self.style = style
        self.action = action
    }

    var body: some View {
        Button(action: action) {
            HStack {
                Spacer()
                Text(text)
                    .padding(.vertical, 14)
                Spacer()
            }
        }
        .buttonStyle(MainButtonStyle(style: style))
    }
}

struct CTAButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 30) {
            MainButton(text: "disabled", style: .disabled) {}
            MainButton(text: "enabled", style: .enabled) {}
            MainButton(text: "canceled", style: .canceled) {}
        }
        .padding(.horizontal)
    }
}
