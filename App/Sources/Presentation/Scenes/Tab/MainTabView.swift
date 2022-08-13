import SwiftUI

struct MainTabView: View {
    @State var selection = 0
    var body: some View {
        TabView(selection: $selection) {
            MainView()
                .tabItem {
                    Image(systemName: "doc.text")
                        .foregroundColor(selection == 0 ? .gray7 : .gray4)
                }
                .tag(0)
            
            Text("Profile")
                .tabItem {
                    Image(systemName: "person.fill")
                        .frame(width: 28, height: 28)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.gray6, lineWidth: selection == 1 ? 1.5 : 0))
                }
                .tag(1)
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
