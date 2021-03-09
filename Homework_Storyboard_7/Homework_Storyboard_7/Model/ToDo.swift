import Foundation

class ToDo: Decodable {
    var userId: Int
    var id: Int
    var title: String
    var completed: Bool
}
