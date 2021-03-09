import UIKit

class ToDoInfoViewController: UIViewController {
    @IBOutlet weak var toDoTextView: UITextView!
    @IBOutlet weak var completionButton: UIButton!
    
    var toDo: ToDo!
    
    @IBAction func completionButtonPressed(_ sender: UIButton) {
        toDo.completed.toggle()
        Network.editToDo(todo: toDo) {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func deleteButtonPressed(_ sender: UIButton) {
        Network.deleteToDo(todo: toDo) {
            AppData.todos.removeAll { todo in
                todo.id == self.toDo.id
            }
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toDoTextView.text = toDo.title
        checkCompleted()
    }
    
    private func checkCompleted() {
        if toDo.completed {
            completionButton.setTitle("Uncomplete", for: .normal)
        }
        else {
            completionButton.setTitle("Complete", for: .normal)
        }
    }
}
