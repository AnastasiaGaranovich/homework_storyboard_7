import Foundation

class Comment: Codable {
    var id: Int
    var name: String
    var email: String
    var body: String
    var postId: Int
}
