import Foundation

struct Feed: Equatable {
    let uid: String
    let content: String
    let imageUrls: [String]
    let likeCount: Int
    let author: Author
}
