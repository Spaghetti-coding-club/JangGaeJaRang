import ProjectDescription

public extension TargetDependency {
    struct SPM {}
}

public extension TargetDependency.SPM {
    static let FirebaseAuth = TargetDependency.package(product: "FirebaseAuth")
    static let FirebaseFirestore = TargetDependency.package(product: "FirebaseFirestore")
    static let FirebaseFirestoreSwift = TargetDependency.package(product: "FirebaseFirestoreSwift")
    static let FirebaseStorage = TargetDependency.package(product: "FirebaseStorage")
    static let Inject = TargetDependency.package(product: "Inject")
}

public extension Package {
    static let Firebase = Package.remote(
        url: "https://github.com/firebase/firebase-ios-sdk.git",
        requirement: .upToNextMajor(from: "9.4.0")
    )
    static let Inject = Package.remote(
        url: "https://github.com/krzysztofzablocki/Inject.git",
        requirement: .upToNextMajor(from: "1.2.1")
    )
}
