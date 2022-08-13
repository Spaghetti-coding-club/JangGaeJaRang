import Combine

class BaseViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var errorMessage = "알 수 없는 오류가 발생했습니다."
    @Published var isErrorOcuured = false
    
}
