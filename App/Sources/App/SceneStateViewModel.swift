import Combine

enum SceneState {
    case signin
    case signup
    case main
}

final class SceneStateViewModel: ObservableObject {
    @Published var sceneState: SceneState = .signin
    
    public init() {
        sceneState = AuthService.shared.checkIsLoggedIn() ? .main : .signin
    }
}
