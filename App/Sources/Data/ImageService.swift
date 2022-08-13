import Foundation
import FirebaseStorage

struct ImageService {
    static let shared = ImageService()
    
    func uploadImage(_ data: Data) async throws -> String {
        let fileName = UUID().uuidString
        let ref = Storage.storage().reference(withPath: "/feed/\(fileName)")
        _ = try await ref.putDataAsync(data)
        let url = try await ref.downloadURL().absoluteString
        return url
    }
    
    func uploadImages(_ datas: [Data]) async throws -> [String] {
        try await datas.asyncMap { try await uploadImage($0) }
    }
}
