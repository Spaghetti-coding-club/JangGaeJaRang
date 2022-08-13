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
            
            ProfileView()
                .tabItem {
                    Image(selection == 1 ? "profileBorder" : "profileSmall")
                }
                .tag(1)
        }
        .accentColor(.gray7)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
