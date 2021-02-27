import UIKit

class UsersViewController: UITableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppData.users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UsersCell") as! UsersCell
        cell.usernameLabel.text = AppData.users[indexPath.row].username
        cell.nameLabel.text = AppData.users[indexPath.row].name
        cell.emailLabel.text = AppData.users[indexPath.row].email
        cell.phoneLabel.text = AppData.users[indexPath.row].phone
        cell.websiteLabel.text = AppData.users[indexPath.row].website
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pushController(storyboard: "Main", name: "UserInfoViewController")
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 165
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "UsersCell", bundle: nil), forCellReuseIdentifier: "UsersCell")
    }
}
