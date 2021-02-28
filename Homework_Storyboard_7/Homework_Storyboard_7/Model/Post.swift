import Foundation

class Post: Decodable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
}
