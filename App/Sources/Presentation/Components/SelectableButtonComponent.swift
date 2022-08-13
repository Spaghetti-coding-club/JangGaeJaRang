import SwiftUI
import CoreText

struct SelectableButtonComponent: View {
    
    var isSelected: Bool
    var title: String
    var action: () -> Void
    
    init(title: String, isSelected: Bool, action: @escaping () -> Void) {
        self.title = title
        self.isSelected = isSelected
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .fillWidth()
                .foregroundColor(.black)
                .padding(.vertical, 18)
        }
        .background(.white)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(
                    isSelected ? Color.defaultGreen : Color.gray3,
                    lineWidth: isSelected ? 2 : 1
                )
        )
        .cornerRadius(5)
    }
}

struct SelectableButtonComponent_Previews: PreviewProvider {
    static var previews: some View {
        SelectableButtonComponent(
            title: "SelectableButton",
            isSelected: false,
            action: {}
        )
    }
}
