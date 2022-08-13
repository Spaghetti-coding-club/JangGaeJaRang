import Foundation

final class SignupStep1VM: BaseViewModel {
    @Published var dogName: String = ""
    @Published var dogBreed: String = ""
    @Published var birthday: Date = Date()
}
