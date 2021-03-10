import Foundation

class ToDo: Codable {
    var userId: Int
    var id: Int
    var title: String
    var completed: Bool
    
    init(userId:Int, title:String) {
        self.id = 0
        self.completed = false
        self.userId = userId
        self.title = title
    }
}
