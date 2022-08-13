import SwiftUI
import Inject

struct ContentView: View {
    
    @ObservedObject private var iO = Inject.observer
    @EnvironmentObject var sceneStateViewModel: SceneStateViewModel
    
    var body: some View {
        switch sceneStateViewModel.sceneState {
        case .signin:
            SigninView()
                .environmentObject(sceneStateViewModel)
                .enableInjection()
            
        case .signup:
            Text("Signup")
            
        case .main:
            MainTabView()
            
        @unknown default:
            Text("Error")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
