import Foundation

class Geo: Decodable {
    var lat: String
    var lng: String
    
    func dataFor(index: Int) -> String {
        switch index {
        case 0:
            return lat
        case 1:
            return lng
        default:
            return "Error"
        }
    }
}
