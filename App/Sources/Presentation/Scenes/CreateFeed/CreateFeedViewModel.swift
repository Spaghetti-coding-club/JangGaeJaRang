import Combine
import SwiftUI

final class CreateFeedViewModel: BaseViewModel {
    @Published var images: [Data] = []
    @Published var content: String = ""
    @Published var selectedImage: UIImage?
    @Published var dismissIsRequired = false
    
    var bag = Set<AnyCancellable>()
    
    enum Input {
        case completeButtonDidTap
    }
    
    func send(_ input: Input) {
        switch input{
        case .completeButtonDidTap:
            completeButtonDidTap()
        }
    }
    
    override init() {
        super.init()
        $selectedImage
            .receive(on: RunLoop.main)
            .compactMap { $0 }
            .sink { [weak self] image in
                guard let self = `self` else { return }
                let data = image.pngData() ?? .init()
                guard !self.images.contains(data) else { return }
                self.images.append(data)
            }
            .store(in: &bag)
    }
    
    private func completeButtonDidTap() {
        Task {
            do {
                try await FeedService.shared.createFeed(content: content, images: images)
                DispatchQueue.main.async { [weak self] in
                    self?.dismissIsRequired = true                    
                }
            } catch {
                print(error.localizedDescription)
                DispatchQueue.main.async { [weak self] in
                    self?.isErrorOcuured = true
                }
            }
        }
    }
}
