import Foundation
import FirebaseFirestore
import FirebaseAuth

struct FeedService {
    static let shared = FeedService()
    
    func fetchFeedList() async throws -> [Feed] {
        let docs = try await Firestore.firestore().collection("/Feed").getDocuments()
        var res: [Feed] = []
        for snapshot in docs.documents {
            let dict = snapshot.data()
            let userDocs = try await Firestore.firestore().collection("/User").document(dict["userPk"] as! String).getDocument().data()
            
            let feed = Feed(
                uid: snapshot.documentID,
                content: dict["content"] as? String ?? "",
                imageUrls: dict["imageUrls"] as? [String] ?? [],
                likeCount: dict["likeCount"] as? Int ?? 0,
                author: Author(
                    dogName: userDocs!["dogName"] as! String,
                    profileImageUrl: userDocs!["profileImageUrl"] as! String
                )
            )
            res.append(feed)
        }
        return res
    }
    
    func createFeed(content: String, images: [Data]) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let urls = try await ImageService.shared.uploadImages(images)
        let data: [String: Any] = [
            "content": content,
            "imageUrls": urls,
            "likeCount": 0,
            "userPk": uid
        ]
        _ = try await Firestore.firestore().collection("/Feed").addDocument(data: data)
    }
}
