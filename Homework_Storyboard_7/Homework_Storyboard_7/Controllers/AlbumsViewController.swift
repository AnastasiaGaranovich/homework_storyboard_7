import UIKit

class AlbumsViewController: UITableViewController {
    var albums: [Album]!
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        albums.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumCell", for: indexPath)
        cell.textLabel?.text = albums[indexPath.row].title
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Network.getPhotos {
            let controller = self.getControllerFrom(storyboard: "Album", name: "PhotosViewController") as! PhotosViewController
            controller.photos = AppData.photos.filter { photo in
                return photo.albumId == self.albums[indexPath.row].id
            }
            self.pushController(viewController: controller)
        }
    }
}
