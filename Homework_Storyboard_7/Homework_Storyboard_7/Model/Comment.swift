import Foundation

class Comment: Decodable {
    var id: Int
    var name: String
    var email: String
    var body: String
    var postId: Int
}
