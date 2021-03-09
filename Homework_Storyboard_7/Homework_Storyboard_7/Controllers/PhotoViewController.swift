import UIKit
import Kingfisher

class PhotoViewController: UIViewController {
    @IBOutlet weak var image: UIImageView!
    
    var photo: Photo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image.kf.setImage(with: URL(string: photo.url))
    }
}

