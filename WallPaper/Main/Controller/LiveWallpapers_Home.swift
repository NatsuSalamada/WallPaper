import UIKit
import Photos
import PhotosUI
import MobileCoreServices


    
    
    


class LiveWallpapers_Home: UIViewController, UIImagePickerControllerDelegate,UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
        @IBOutlet weak var Coll_Live: CollLiveviewCell!
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      return CGSize(width: self.view.bounds.size.width, height:self.view.bounds.size.height)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Coll_LivePhoto", for: indexPath) as! CollLiveviewCell
        return cell
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

