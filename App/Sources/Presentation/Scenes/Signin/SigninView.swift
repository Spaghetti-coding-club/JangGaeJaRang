import SwiftUI
import AuthenticationServices

struct SigninView: View {
    var body: some View {
        ZStack {
            Color.background
            
            VStack {
                Text("강아지 중심\n장기자랑 서비스")
                    .lineLimit(0)
                    .padding(.top, 130)
                
                Image("JangGaeJaRangLogo")
                    .resizable()
                    .padding(.horizontal, 36)
                    .padding(.top, 45)
                
                Spacer()
                
                SignInWithAppleButton { request in
                    
                } onCompletion: { res in
                    
                }
                .padding(.horizontal, 41)
                .padding(.bottom, 80)
            }
        }
    }
}

struct SigninView_Previews: PreviewProvider {
    static var previews: some View {
        SigninView()
    }
}
