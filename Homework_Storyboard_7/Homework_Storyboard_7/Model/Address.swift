import Foundation

class Address: Codable {
    var street: String
    var suite: String
    var city: String
    var zipcode: String
    var geo: Geo
    
    func dataFor(index: Int) -> String {
        switch index {
        case 0:
            return city
        case 1:
            return street
        case 2:
            return suite
        case 3:
            return zipcode
        default:
            return "Error"
        }
    }
}
