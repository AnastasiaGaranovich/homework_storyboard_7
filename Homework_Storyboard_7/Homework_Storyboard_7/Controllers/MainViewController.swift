import UIKit

enum UserAction: String, CaseIterable {
    case downloadImage = "Download Image"
    case users = "Users"
}

class MainViewController: UICollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return UserAction.allCases.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let userAction = UserAction.allCases[indexPath.item]
        
        switch userAction {
        case .downloadImage:
            break
        case .users:
            Network.getUsers {
                self.pushController(storyboard: "Main", name: "UsersViewController")
            }
        }
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCell", for: indexPath) as! MainCell
        cell.userActionLabel.text = UserAction.allCases[indexPath.item].rawValue
        return cell
    }
    
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 20, height: 80)
    }
}
