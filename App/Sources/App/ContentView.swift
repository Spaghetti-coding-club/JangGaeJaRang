import SwiftUI
import Inject

struct ContentView: View {
    @StateObject var injectIO = Inject.observer
    var body: some View {
        SigninView()
            .enableInjection()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
