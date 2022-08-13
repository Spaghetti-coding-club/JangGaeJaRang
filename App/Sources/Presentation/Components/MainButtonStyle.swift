import SwiftUI

extension MainButton {
    enum Style {
        case disabled, enabled
    }
}

struct MainButtonStyle: ButtonStyle {
    var style: MainButton.Style

    func makeBody(configuration: Configuration) -> some View {
        switch style {
        case .disabled:
            return AnyView(DisabledButton(configuration: configuration))
        case .enabled:
            return AnyView(EnabledButton(configuration: configuration))
        }
    }

}

extension MainButtonStyle {
    struct DisabledButton: View {
        let configuration: ButtonStyle.Configuration
        var body: some View {
            configuration.label
                .font(Font.system(size: 15, weight: .semibold))
                .background(Color.disabledGreen)
                .cornerRadius(5)
        }
    }

    struct EnabledButton: View {
        let configuration: ButtonStyle.Configuration
        var body: some View {
            configuration.label
                .font(Font.system(size: 15, weight: .semibold))
                .background(Color.defaultGreen)
                .shadow(
                    color: .black.opacity(configuration.isPressed ? 0 : 0.06),
                    radius: configuration.isPressed ? 0 : 4,
                    x: 0,
                    y: configuration.isPressed ? 0 : 4
                )
                .cornerRadius(5)
        }
    }
}

