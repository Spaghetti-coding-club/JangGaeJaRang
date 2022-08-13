import SwiftUI
import AuthenticationServices

struct SigninView: View {
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            
            VStack {
                Text("강아지 중심\n장기자랑 서비스")
                    .font(.system(size: 36, weight: .bold))
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .padding(.top, 130)
                
                Image("JangGaeJaRangLogo")
                    .resizable()
                    .frame(height: 95)
                    .padding(.horizontal, 36)
                    .padding(.top, 45)
                
                Spacer()
                
                SignInWithAppleButton { request in
                    
                } onCompletion: { res in
                    
                }
                .signInWithAppleButtonStyle(.white)
                .frame(height: 57)
                .padding(.horizontal, 41)
                .padding(.bottom, 80)
            }
        }
    }
}
