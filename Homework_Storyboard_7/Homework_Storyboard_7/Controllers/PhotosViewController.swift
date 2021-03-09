import UIKit
import Kingfisher

class PhotosViewController: UICollectionViewController {
    
    var photos: [Photo]!
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = getControllerFrom(storyboard: "Album", name: "PhotoViewController") as! PhotoViewController
        controller.photo = photos[indexPath.row]
        pushController(viewController: controller)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        cell.photoImage.kf.setImage(with: URL(string: photos[indexPath.row].thumbnailUrl))
        return cell
    }
}
