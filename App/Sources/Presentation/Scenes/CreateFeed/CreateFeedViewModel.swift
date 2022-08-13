import Combine
import SwiftUI

final class CreateFeedViewModel: BaseViewModel {
    @Published var images: [Data] = []
    @Published var content: String = ""
    @Published var selectedImage: UIImage?
    
    var bag = Set<AnyCancellable>()
    
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
}
