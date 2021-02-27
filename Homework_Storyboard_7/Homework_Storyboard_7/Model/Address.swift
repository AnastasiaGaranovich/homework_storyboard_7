import Foundation

class Address: Decodable {
    var street: String
    var suite: String
    var city: String
    var zipcode: String
    var geo: Geo
}
