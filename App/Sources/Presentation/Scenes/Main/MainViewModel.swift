import Foundation

final class MainViewModel: BaseViewModel {
    @Published var feedList: [Feed] = []
    
    enum Input {
        case onAppear
    }
    
    func send(_ input: Input) {
        switch input {
        case .onAppear:
            onAppear()
        }
    }
    
    private func onAppear() {
        Task {
            let list = try? await FeedService.shared.fetchFeedList()
            DispatchQueue.main.async { [weak self] in
                self?.feedList.append(contentsOf: list ?? [])                
            }
        }
    }
}
