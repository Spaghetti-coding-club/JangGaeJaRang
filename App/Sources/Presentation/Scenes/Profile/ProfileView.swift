import SwiftUI

struct ProfileView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Image("Phy")
                .onTapGesture {
                    UIApplication.shared.open(URL(string: "https://www.instagram.com/baegteun/")!)
                }
        }
        .ignoresSafeArea()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
