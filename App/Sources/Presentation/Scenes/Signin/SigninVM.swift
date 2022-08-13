import Foundation

final class SigninVM: BaseViewModel {
    private let authService = AuthService.shared
    var nonce: String? = nil
    @Published var sceneState = SceneState.signin
    
    enum Input {
        case appleSigninCompleted(cred: Data)
    }
    
    func send(_ input: Input) {
        switch input {
        case let .appleSigninCompleted(cred):
            appleSigninCompleted(cred: cred)
        }
    }
    
    private func appleSigninCompleted(cred: Data) {
        guard let idToken = String(data: cred, encoding: .utf8) else { return }
        guard let nonce = nonce else { return }
        
        Task {
            do {
                let isInitialSignin = try await authService.signin(idToken: idToken, nonce:nonce)
                sceneState = isInitialSignin ? .signup : .main
            } catch {
                isErrorOcuured = true
            }
        }
    }
}
