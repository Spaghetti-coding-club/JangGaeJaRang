import Foundation

enum Gender: CaseIterable{
    case male, female
    case neutralMale, neutralFemale
    
    var title: String {
        switch self {
        case .male:
            return "남"
        case .female:
            return "여"
        case .neutralMale:
            return "중성 남"
        case .neutralFemale:
            return "중성 여"
        }
    }
}

enum DogSize: CaseIterable {
    case big, medium, small
    
    var title: String {
        switch self {
        case .big:
            return "대형견"
        case .medium:
            return "중형견"
        case .small:
            return "소형견"
        }
    }
}

class SignupStep2VM: ObservableObject {
    
    @Published var gender: Gender?
    @Published var dogSize: DogSize?
}
