import UIKit
import Photos
import PhotosUI
import MobileCoreServices


    
    
    


class LiveWallpapers_Home: UIViewController, UIImagePickerControllerDelegate,UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var Coll_Live: UICollectionView!
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      return CGSize(width: self.view.bounds.size.width, height:self.view.bounds.size.height)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return json_LiveImageHome.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Coll_LivePhoto", for: indexPath) as! CollLiveviewCell
       
        
      
        var documentsUrl:URL =  (FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first as URL?)!
        
            let destinationFileUrl = documentsUrl.appendingPathComponent("Home-\(indexPath.row + 1).mov")
            print(destinationFileUrl)
            if documentsUrl.isFileURL == true
            {
                    documentsUrl.removeAllCachedResourceValues()
            }
            //Create URL to the source file you want to download
            let fileURL = URL(string: json_LiveImageHome[indexPath.row])
            let sessionConfig = URLSessionConfiguration.default
            let session = URLSession(configuration: sessionConfig)
            let request = URLRequest(url:fileURL!)
        let download = DispatchQueue.global()
        download.async {
            
            let task = session.downloadTask(with: request) { (tempLocalUrl, response, error) in
                if let tempLocalUrl = tempLocalUrl, error == nil {
                    // Success
                    if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                        print("Successfully downloaded. Status code: \(statusCode)")
                    }
                    
                    do {
                        try FileManager.default.copyItem(at: tempLocalUrl, to: destinationFileUrl)
                        
                    } catch (let writeError) {
                        
                        print("Error creating a file \(destinationFileUrl) : \(writeError)")
                    }
                    
                } else {
                    
                    print("Error took place while downloading a file. Error description: %@", error?.localizedDescription);
                }
            }
            task.resume()
        }
            DispatchQueue.main.async {
                 cell.loadVideoWithVideoURL(destinationFileUrl)
            }
           
        
        
        return cell
    }
    @objc func reloadLiveHome()
    {
        Coll_Live.reloadData()
    
    }
    
    
    
//    @IBAction func btnDownload(_ sender: Any) {
//        UISaveVideoAtPathToSavedPhotosAlbum(, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), contextInfo: UnsafeRawPointer)
//    }
//    
//    @objc func image(_ image: UIImage, didFinishSavingWithError error: NSError?, contextInfo: UnsafeRawPointer) {
//        if let error = error {
//            
//            let ac = UIAlertController(title: "Save error", message: error.localizedDescription, preferredStyle: .alert)
//            ac.addAction(UIAlertAction(title: "OK", style: .default))
//            present(ac, animated: true)
//        } else {
//            
//            let ac = UIAlertController(title: "Saved!", message: "The screenshot has been saved to your photos.", preferredStyle: .alert)
//            ac.addAction(UIAlertAction(title: "OK", style: .default))
//            present(ac, animated: true)
//        }
//    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getJson_LiveHomeImage.sharedInstance.fetchFeedForUrlString()
        NotificationCenter.default.addObserver(self, selector: #selector(reloadLiveHome), name: .LiveDownload, object: nil)
    }
}
extension Notification.Name{
    static let LiveDownload = Notification.Name("Downloading")
}
