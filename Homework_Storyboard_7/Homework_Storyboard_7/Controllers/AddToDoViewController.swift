import UIKit

class AddToDoViewController: UIViewController {
    @IBOutlet weak var todoTextView: UITextView!
    
    var userId: Int!
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        let newTodo = ToDo(userId: userId, title: todoTextView.text)
        Network.addToDo(todo: newTodo) {
            AppData.todos.append(newTodo)
            self.navigationController?.popViewController(animated: true)
        }
    }
}
