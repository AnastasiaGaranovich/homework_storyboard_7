import Foundation
import Alamofire

class Network {
    private static let rootUrl = "http://localhost:3000/"
    private static let usersUrl = rootUrl + "users"
    private static let postsUrl = rootUrl + "posts"
    private static let commentsUrl = rootUrl + "comments"
    private static let albumsUrl = rootUrl + "albums"
    private static let photosUrl = rootUrl + "photos"
    private static let todosUrl = rootUrl + "todos"
    
    static func getUsers(_ completion: @escaping () -> ()) {
        guard let url = URL(string: usersUrl) else {
            print("No user url")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
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
    
    static func getToDos(_ completion: @escaping () -> ()) {
        AF.request(todosUrl).responseData {
            response in
            switch response.result {
            case .success(let value):
                do {
                    AppData.todos = try JSONDecoder().decode([ToDo].self, from: value)
                    DispatchQueue.main.async {
                        completion()
                    }
                }
                catch let error {
                    print(error)
                }
                print(value)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    static func getAlbums(_ completion: @escaping () -> ()) {
        AF.request(albumsUrl).responseData {
            response in
            switch response.result {
            case .success(let value):
                do {
                    AppData.albums = try JSONDecoder().decode([Album].self, from: value)
                    DispatchQueue.main.async {
                        completion()
                    }
                }
                catch let error {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    static func getPhotos(_ completion: @escaping () -> ()) {
        AF.request(photosUrl).responseDecodable(of: [Photo].self) {
            response in
            switch response.result {
            case .success(let photos):
                AppData.photos = photos
                DispatchQueue.main.async {
                    completion()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    static func editToDo(todo: ToDo, _  completion: @escaping () -> ()) {
        AF.request(todosUrl + "/\(todo.id)", method: .put, parameters: todo, encoder: JSONParameterEncoder.default).response {
            response in
            switch response.result {
            case .success(_):
                DispatchQueue.main.async {
                    completion()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    static func deleteToDo(todo: ToDo, _ completion: @escaping () -> ()) {
        AF.request(todosUrl + "/\(todo.id)", method: .delete).response {
            response in
            switch response.result {
            case .success(_):
                DispatchQueue.main.async {
                    completion()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    static func addPost(post: Post, _ completion: @escaping () -> ()) {
        AF.request(postsUrl, method: .post, parameters: post, encoder: JSONParameterEncoder.default).responseDecodable(of: Post.self) {
            response in
            switch response.result {
            case .success(let serverPost):
                post.id = serverPost.id
                DispatchQueue.main.async {
                    completion()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    static func addToDo(todo: ToDo, _ completion: @escaping () -> ()) {
        AF.request(todosUrl, method: .post, parameters: todo, encoder: JSONParameterEncoder.default).responseDecodable(of: ToDo.self) {
            response in
            switch response.result {
            case .success(let serverTodo):
                todo.id = serverTodo.id
                DispatchQueue.main.async {
                    completion()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
