import Foundation

class Company: Codable {
    var name: String
    var catchPhrase: String
    var bs: String
    
    func dataFor(index: Int) -> String {
        switch index {
        case 0:
            return name
        case 1:
            return catchPhrase
        case 2:
            return bs
        default:
            return "Error"
        }
    }
}
