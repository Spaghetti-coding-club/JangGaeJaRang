import SwiftUI
import AuthenticationServices

struct SigninView: View {
    @EnvironmentObject var sceneStateViewModel: SceneStateViewModel
    @StateObject var viewModel = SigninVM()
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
                    request.requestedScopes = [.fullName, .email]
                    let nonce = FirebaseAppleUtils.randomNonceString()
                    request.nonce = FirebaseAppleUtils.sha256(nonce)
                    viewModel.nonce = nonce
                } onCompletion: { res in
                    switch res {
                    case let .success(auth):
                        guard let cred = auth.credential as? ASAuthorizationAppleIDCredential else {
                            return
                        }
                        viewModel.send(.appleSigninCompleted(cred: cred.identityToken ?? .init()))
                        
                    case .failure:
                        viewModel.isErrorOcuured = true
                    }
                }
                .signInWithAppleButtonStyle(.white)
                .frame(height: 57)
                .padding(.horizontal, 41)
                .padding(.bottom, 80)
            }
        }
        .onReceive(viewModel.$sceneState) { _ in
            sceneStateViewModel.sceneState = viewModel.sceneState
        }
    }
}
