import UIKit

class ToDoViewController: UITableViewController {
    var userId: Int!
    
    var todos: [ToDo] {
        AppData.todos.filter { toDo in
            toDo.userId == userId
        }
    }
    
    var completedToDos: [ToDo] {
        todos.filter { toDo in
            return toDo.completed == true
        }
    }
    
    var currentToDos: [ToDo] {
        todos.filter { toDo in
            return toDo.completed == false
        }
    }
    
    @IBAction func addToDoButtonPressed(_ sender: UIBarButtonItem) {
        let controller = getControllerFrom(storyboard: "ToDo", name: "AddToDoViewController") as! AddToDoViewController
        controller.userId = userId
        pushController(viewController: controller)
        
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Current"
        }
        if section == 1 {
            return "Completed"
        }
        return nil
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath)
        cell.textLabel?.text = todoForPath(indexPath).title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return currentToDos.count
        }
        if section == 1 {
            return completedToDos.count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = getControllerFrom(storyboard: "ToDo", name: "ToDoInfoViewController") as! ToDoInfoViewController
        controller.toDo = todoForPath(indexPath)
        pushController(viewController: controller)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle != .delete) { return }

        let deletingTodo = todoForPath(indexPath)
        Network.deleteToDo(todo: deletingTodo) {
            AppData.todos.removeAll { todo in
                todo.id == deletingTodo.id
            }
            self.tableView.reloadData()
        }
    }
    
    private func todoForPath(_ indexPath: IndexPath) -> ToDo {
        if indexPath.section == 0 {
            return currentToDos[indexPath.row]
        }
        else if indexPath.section == 1 {
            return completedToDos[indexPath.row]
        }
        else {
            fatalError("Invalid section index")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
}
