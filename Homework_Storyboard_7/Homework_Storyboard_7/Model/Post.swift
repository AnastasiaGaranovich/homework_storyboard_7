import Foundation

class Post: Codable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
    
    init(userId: Int, title: String, body: String) {
        self.id = 0
        self.userId = userId
        self.title = title
        self.body = body
    }
}
