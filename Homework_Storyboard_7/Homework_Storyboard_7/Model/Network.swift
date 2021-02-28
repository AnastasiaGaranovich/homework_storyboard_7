import Foundation

class Network {
    private static let rootUrl = "https://jsonplaceholder.typicode.com/"
    private static let usersUrl = rootUrl + "users"
    private static let postsUrl = rootUrl + "posts"
    private static let commentsUrl = rootUrl + "comments"
    
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
            } catch let error {
                print(error)
            }
            DispatchQueue.main.async {
                completion()
            }
        }
        task.resume()
    }
    
    static func getPosts(_ completion: @escaping () -> ()) {
        guard let url = URL(string: postsUrl) else {
            print("No posts url")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else {
                print("No posts data")
                return
            }
            do {
                AppData.posts = try JSONDecoder().decode([Post].self, from: data)
            } catch let error {
                print(error)
            }
            DispatchQueue.main.async {
                completion()
            }
        }
        task.resume()
    }
    
    static func getComments(_ completion: @escaping () -> ()) {
        guard let url = URL(string: commentsUrl) else {
            print("No comments url")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else {
                print("No comments data")
                return
            }
            do {
                AppData.comments = try JSONDecoder().decode([Comment].self, from: data)
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
