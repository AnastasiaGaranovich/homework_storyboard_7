import UIKit

class PostsViewController: UITableViewController {
    var userId: Int!
    
    var usersPosts: [Post] {
        AppData.posts.filter { post in
            post.userId == userId
        }
    }
    
    @IBAction func addPostButtonPressed(_ sender: UIBarButtonItem) {
        pushController(storyboard: "Post", name: "AddPostViewController")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersPosts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell")
        cell?.textLabel?.text = usersPosts[indexPath.row].title
        cell?.textLabel?.numberOfLines = 0
        cell?.detailTextLabel?.text = usersPosts[indexPath.row].body
        cell?.detailTextLabel?.numberOfLines = 0
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Network.getComments {
            let controller = self.getControllerFrom(storyboard: "Post", name: "CommentsViewController") as! CommentsViewController
            controller.comments = AppData.comments.filter { comment in
                return comment.postId == self.usersPosts[indexPath.row].id
            }
            self.pushController(viewController: controller)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 165
    }
}
