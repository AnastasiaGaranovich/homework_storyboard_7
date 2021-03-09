import UIKit

class ToDoViewController: UITableViewController {
    
    var toDos: [ToDo]!
    
    var completedToDos: [ToDo] {
        toDos.filter { toDo in
            return toDo.completed == true
        }
    }
    
    var currentToDos: [ToDo] {
        toDos.filter { toDo in
            return toDo.completed == false
        }
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
        if indexPath.section == 1 {
            cell.textLabel?.text = completedToDos[indexPath.row].title
        }
        else {
            cell.textLabel?.text = currentToDos[indexPath.row].title
        }
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
}
