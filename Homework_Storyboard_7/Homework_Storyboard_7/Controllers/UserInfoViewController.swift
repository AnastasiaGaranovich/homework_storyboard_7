import UIKit

class UserInfoViewController: UIViewController {
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var postsButton: UIButton!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameLabel.text = user.name
    }
    
    @IBAction func postsButtonPressed(_ sender: UIButton) {
        Network.getPosts {
            let controller = self.getControllerFrom(storyboard: "Main", name: "PostsViewController") as! PostsViewController
            controller.usersPosts = AppData.posts.filter { post in
                return post.userId == self.user.id
            }
            self.pushController(viewController: controller)
        }
    }
}

extension UserInfoViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 4
        }
        if section == 1 {
            return 2
        }
        if section == 2 {
            return 3
        }
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Address"
        }
        if section == 1 {
            return "Geo"
        }
        if section == 2 {
            return "Company"
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserInfoCell", for: indexPath)
        if indexPath.section == 0 {
            cell.textLabel?.text = user.address.dataFor(index: indexPath.row)
        }
        if indexPath.section == 1 {
            cell.textLabel?.text = user.address.geo.dataFor(index: indexPath.row)
        }
        if indexPath.section == 2 {
            cell.textLabel?.text = user.company.dataFor(index: indexPath.row)
        }
        return cell
    }
}
