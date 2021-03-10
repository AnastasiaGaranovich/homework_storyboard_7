import UIKit

class AddPostViewController: UIViewController {
    @IBOutlet weak var titleLabel: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    var userId: Int!
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        let newPost = Post(userId: userId, title: titleLabel.text ?? "", body: bodyTextView.text)
        Network.addPost(post: newPost) {
            AppData.posts.append(newPost)
            self.navigationController?.popViewController(animated: true)
        }
    }
}
