import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

struct AuthService {
    static let shared = AuthService()
    func signin(idToken: String, nonce: String) async throws -> Bool {
        let cred = OAuthProvider.credential(
            withProviderID: "apple.com",
            idToken: idToken,
            rawNonce: nonce
        )
        guard let res = try? await Auth.auth().signIn(with: cred) else { throw JGJRError.signinIsFailed }
        guard let user = try? await Firestore.firestore().collection("User").document(res.user.uid).getDocument() else { throw JGJRError.signinIsFailed }
        return (user.data()?["isFirst"] as? Bool ?? true) == true
    }
}
