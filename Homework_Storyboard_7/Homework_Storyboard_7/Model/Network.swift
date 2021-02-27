import Foundation

class Network {
    private static let rootUrl = "https://jsonplaceholder.typicode.com/"
    private static let usersUrl = rootUrl + "users"
    static func getUsers(_ completion: @escaping () -> ()) {
        guard let url = URL(string: usersUrl) else {
            print("No user url")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else {
                print("No user data")
                return
            }
            do {
                AppData.users = try JSONDecoder().decode([User].self, from: data)
                print(AppData.users)
            } catch let error {
                print(error)
            }
            DispatchQueue.main.async {
                completion()
            }
        }
        task.resume()
    }
}
