import UIKit
import Photos
import PhotosUI
import MobileCoreServices
import AVFoundation

    
    
    


class LiveWallpapers_Home: UIViewController, UIImagePickerControllerDelegate,UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var Coll_Live: UICollectionView!
<<<<<<< HEAD
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      return CGSize(width: self.view.bounds.size.width, height:self.view.bounds.size.height)
    }
    lazy var downloadPhotoQueue:OperationQueue = {
        let queue = OperationQueue()
        queue.name = "Download Photo"
        queue.maxConcurrentOperationCount = 2
        return queue
    }()
    
    var downloadingTasks = Dictionary<IndexPath,Operation>()
    let photoCache:NSCache<AnyObject,AnyObject> = NSCache<AnyObject,AnyObject>()
   
    
    
    
    
    
    var btnDownload:UIButton = {
        let btnDownload = UIButton()
        btnDownload.setImage( #imageLiteral(resourceName: "saveBtn"), for: .normal)
        btnDownload.addTarget(self, action: #selector(btnDownload(_:)), for: .touchUpInside)
        return btnDownload
    }()
    
    
    @objc func btnDownload(_ sender: UIButton!) {
        guard let cell = (Coll_Live.visibleCells.first as? CollLiveviewCell) else {
            return
        }
        
        if cell.filePath != ""{
            var g = UserDefaults.standard.value(forKey: "Show") as! Int
            g = g - 1
            if g == 0{
                DD = 2
                Up(v: self)
                UserDefaults.standard.set(5, forKey: "Show")
            }else{
                self.S()
                UserDefaults.standard.set(g, forKey: "Show")
            }
           
        }
    }
    
    @objc func SaveSC(){
        let ac = UIAlertController(title: "Saved!", message: "The livephoto has been saved to your photos.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(S), name: .SLHome, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(reloadLiveHome), name: .LiveDownload, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(loadprogress(_:)), name: .Loadpercent_livewallpaperHome, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(initLive), name: .initLive, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(SaveSC), name: .SaveSCHome, object: nil)
        
        view.addSubview(btnDownload)
        
        
        btnDownload.frame = CGRect(x: (view.frame.size.width/2)-50.5, y: view.frame.size.height-HIPH(h: 93)
            , width: 101, height: 48)
        
       
       
        
    }
    @objc func S(){
        guard let cell = (Coll_Live.visibleCells.first as? CollLiveviewCell) else {
            return
        }
        cell.exportLivePhoto()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.Coll_Live.reloadData()
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.disconected()
    }
    
    @objc func loadprogress(_ notification: Notification){
        DispatchQueue.main.async {
            
            
            
            guard let data = notification.userInfo as? [String: Any] else{
                return
            }
            
            guard let index = data["index"] as? Int else{
                return
            }
            
            guard let precent = data["precent"] as? CGFloat else{
                return
            }
            
            
            if index == self.Coll_Live.indexPath(for: self.Coll_Live.visibleCells.first!)?.row{
                let cell = (self.Coll_Live.visibleCells.first) as! CollLiveviewCell
                cell.shapeLayer.isHidden = false
                cell.pulsatingLayer.isHidden = false
                cell.trackLayer.isHidden = false
                cell.percentageLabel.isHidden = false
                
                
                cell.percentageLabel.text = "\(Int(precent * 100))% "
                cell.shapeLayer.strokeEnd = precent
                
                if precent >= 0.99{
                    UIView.animate(withDuration: 1) {

                        
                        cell.percentageLabel.text = "99% "
                        cell.shapeLayer.strokeEnd = 0.99
                        
                    }
                }
                else{
                    
                    UIView.animate(withDuration: 1) {
                        cell.percentageLabel.isHidden = false
                        
                    }
                }
            }
        }
=======
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      return CGSize(width: self.view.bounds.size.width, height:self.view.bounds.size.height)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return json_LiveImageHome.count
>>>>>>> 448d4ba881ec20425d0a2a44225b3512f98b7080
    }
    
    @objc func initLive(_ notification: Notification){
        
        
        guard let data = notification.userInfo as? [String: Any] else{
            return
        }

        guard let index = data["index"] as? Int else{
            return
        }
        let cell = (self.Coll_Live.visibleCells.first) as! CollLiveviewCell
        if index == self.Coll_Live.indexPath(for: self.Coll_Live.visibleCells.first!)?.row{
            
            if let label = cell.contentView.viewWithTag(10) as? UILabel{
                label.removeFromSuperview()
            }
            if let sublayers = cell.contentView.layer.sublayers{
                for sublayer in sublayers{
                    if sublayer.name == "shapeLayer" || sublayer.name == "pulsatingLayer" || sublayer.name == "trackLayer"{
                        sublayer.removeFromSuperlayer()
                    }
                }
            }
            cell.contentView.bringSubview(toFront: cell.livePhotoView)
            cell.img_live.isHidden = true
            
            if cell.livePhotoView.livePhoto == nil{
                let userPhoto = LivePhotoList[index]
                let keyCache = "LivePH-\(userPhoto.id)"
                for live in livePhotoTemp{
                    if keyCache == live.key{
                        cell.livePhotoView.livePhoto = live.value.livePhoto
                        cell.livePhotoView.isMuted = true
                        break
                    }
                }
            }
            cell.reloadInputViews()
            cell.loadingMainView.isHidden = true
        }
        
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return LivePhotoList.count
    }
    func reloadVisibleCells() {
        UIView.setAnimationsEnabled(false)
        self.Coll_Live.performBatchUpdates({
            
            let visibleCellIndexPaths = self.Coll_Live.indexPathsForVisibleItems
            self.Coll_Live.reloadItems(at: visibleCellIndexPaths)
        }) { (finished) in
            UIView.setAnimationsEnabled(true)
        }
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y + scrollView.bounds.size.height
        
        if offsetY >= scrollView.contentSize.height {
            //loadData(nextKeyId: nextKeyId)
        }
        reloadVisibleCells()
        
    }
    func startDownloadImage(operation:DownloadVideoOperation, indexPath: IndexPath) {
        
        if let _ = downloadingTasks[indexPath] {
            return
        }
        
        downloadingTasks[indexPath] = operation
        downloadPhotoQueue.addOperation(operation)
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView.isDecelerating {
            self.disconected()
            
        }
    }
    func disconected(){
//        print("VaoDis")
        for download in downloadingTasks{
//            print("VaoDisdownload")
            guard let DL = download.value as? DownloadVideoOperation else{
                return
            }
            if DL.downloadtask?.state == .running{
                DL.downloadtask?.cancel()
            }
//            print("RaDisdownload")
        }
        downloadPhotoQueue.cancelAllOperations()
        
        downloadingTasks.removeAll()
//        print("RaDis")
    }
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Coll_LivePhoto", for: indexPath) as! CollLiveviewCell
<<<<<<< HEAD
        let userPhoto = LivePhotoList[indexPath.row]
        let keyCache = userPhoto.id
        let documentsURL = FileManager.default
        let manager = documentsURL.urls(for: .documentDirectory, in: .allDomainsMask).first!
        let filePaths = manager.appendingPathComponent("\(keyCache).mov")
        cell.loadingMainView.isHidden = true
        
        if documentsURL.fileExists(atPath: filePaths.path)
        {
            if let label = cell.contentView.viewWithTag(10) as? UILabel{
                label.removeFromSuperview()
            }
            if let sublayers = cell.contentView.layer.sublayers{
                for sublayer in sublayers{
                    if sublayer.name == "shapeLayer" || sublayer.name == "pulsatingLayer" || sublayer.name == "trackLayer"{
                        sublayer.removeFromSuperlayer()
                    }
                }
            }
            cell.loadingMainView.isHidden = false
            cell.imageLoading.image = self.generateThumbnail(url: filePaths)
           
            
            
            for live in livePhotoTemp{
                if "LivePH-\(keyCache)" == live.key{
                    cell.loadingMainView.isHidden = true
                    if let label = cell.contentView.viewWithTag(10) as? UILabel{
                        label.removeFromSuperview()
                    }
                    if let sublayers = cell.contentView.layer.sublayers{
                        for sublayer in sublayers{
                            if sublayer.name == "shapeLayer" || sublayer.name == "pulsatingLayer" || sublayer.name == "trackLayer"{
                                sublayer.removeFromSuperlayer()
                            }
                        }
                    }
                    cell.contentView.bringSubview(toFront: cell.livePhotoView)
                    cell.img_live.isHidden = true
                    cell.livePhotoView.livePhoto = live.value.livePhoto
                    cell.livePhotoView.isMuted = true
                    
                    if !collectionView.isDecelerating {
                        cell.livePhotoView.startPlayback(with: .full)
                        
                    }
                    
                    break
                }
            }
           
            
        }else{
            if let downloadedVid = photoCache.object(forKey: keyCache as AnyObject) as? Data{
                if let label = cell.contentView.viewWithTag(10) as? UILabel{
                    label.removeFromSuperview()
                }
                if let sublayers = cell.contentView.layer.sublayers{
                    for sublayer in sublayers{
                        if sublayer.name == "shapeLayer" || sublayer.name == "pulsatingLayer" || sublayer.name == "trackLayer"{
                            sublayer.removeFromSuperlayer()
                        }
                    }
                }
                
                let documents = FileManager.default
                let manager = documents.urls(for: .documentDirectory, in: .allDomainsMask).first!
                let fileURL = manager.appendingPathComponent("\(keyCache).mov")
                do{
                    try downloadedVid.write(to: fileURL, options: .atomic)
                }catch{
                    print(" Lỗi Lưu Video ")
                }
                cell.loadingMainView.isHidden = false
                cell.imageLoading.image = self.generateThumbnail(url: filePaths)
                cell.loadVideoWithVideoURL(fileURL, imagedTemp: "LivePH-\(keyCache)", index: indexPath.row)
              
            }else{
                cell.layoutIfNeeded()

                if let label = cell.contentView.viewWithTag(10) as? UILabel{
                    label.removeFromSuperview()
                }
                if let sublayers = cell.contentView.layer.sublayers{
                    for sublayer in sublayers{
                        if sublayer.name == "shapeLayer" || sublayer.name == "pulsatingLayer" || sublayer.name == "trackLayer"{
                            sublayer.removeFromSuperlayer()
                        }
                    }
                }
                
                cell.setupCircleLayers()
                cell.setupPercentageLabel()
                cell.shapeLayer.isHidden = false
                cell.pulsatingLayer.isHidden = false
                cell.trackLayer.isHidden = false
                cell.percentageLabel.isHidden = false
                cell.img_live.isHidden = false
                cell.img_live.image =  #imageLiteral(resourceName: "catch")
                
                cell.shapeLayer.strokeEnd = 0
                
                cell.percentageLabel.text = "0%"
                cell.livePhotoView.livePhoto = nil
                cell.filePath = ""
                
                if !collectionView.isDecelerating {
                    let id = IndexPath(item: indexPath.row, section: 0)
                    let downloadPhoto = DownloadVideoOperation(indexPath: id, videoURL: userPhoto.link, needPercent: 1, delegate: self as DownloadVideoOperationDelegate, key: keyCache)
                    startDownloadImage(operation: downloadPhoto, indexPath: id)
                    
                }
               
            }
        }
        cell.frame.origin.y = self.Coll_Live.bounds.origin.y
=======
       
        
      
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
           
        
        
>>>>>>> 448d4ba881ec20425d0a2a44225b3512f98b7080
        return cell
    }
    @objc func reloadLiveHome()
    {
        Coll_Live.reloadData()
    }
<<<<<<< HEAD

    
    
}
extension Notification.Name{
  
}
extension LiveWallpapers_Home: DownloadVideoOperationDelegate {
    func DownloadVideoDidFail(operation: DownloadVideoOperation) {
    }
    func DownloadVideoDidFinish(operation: DownloadVideoOperation, video: Data) {
        let userPhoto = LivePhotoList[operation.indexPath.item]
        let keyCache = userPhoto.id
        
        self.photoCache.setObject(video as AnyObject, forKey: keyCache as AnyObject)
        let id = IndexPath(item: operation.indexPath.row, section: 0)
        
        self.Coll_Live.reloadItems(at: [id])
        downloadingTasks.removeValue(forKey: operation.indexPath)
    }
    
    

}
extension LiveWallpapers_Home{
    func generateThumbnail(url: URL) -> UIImage? {
        do {
            let asset = AVURLAsset(url: url)
            let imageGenerator = AVAssetImageGenerator(asset: asset)
            imageGenerator.appliesPreferredTrackTransform = true
            let cgImage = try imageGenerator.copyCGImage(at: kCMTimeZero, actualTime: nil)
            
            return UIImage(cgImage: cgImage)
        } catch {
            print(error.localizedDescription)
            
            return nil
        }
    }
=======
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getJson_LiveHomeImage.sharedInstance.fetchFeedForUrlString()
        NotificationCenter.default.addObserver(self, selector: #selector(reloadLiveHome), name: .LiveDownload, object: nil)
    }
}
extension Notification.Name{
    static let LiveDownload = Notification.Name("Downloading")
>>>>>>> 448d4ba881ec20425d0a2a44225b3512f98b7080
}
