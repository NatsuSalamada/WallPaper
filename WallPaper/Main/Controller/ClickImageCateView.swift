//
//  ClickImageCateView.swift
//  WallPaper
//
//  Created by User on 6/8/18.
//  Copyright © 2018 NatsuSalamada. All rights reserved.
//

import UIKit


class ClickImageCateView: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
<<<<<<< HEAD
    @IBOutlet weak var Collection_ClickView: UICollectionView!
    @IBAction func abtn_BacktoCate(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        GoogleAdMob.sharedInstance.view = nil
        RE.sharedInstanceRE.view = nil
    }
    @IBAction func btnDownload(_ sender: Any) {
        guard let cell = (Collection_ClickView.visibleCells.first as? ClickView_CollectionViewCell) else {
            return
        }
        
        if cell.downloaded{
                        var g = UserDefaults.standard.value(forKey: "Show") as! Int
                        g = g - 1
                        if g == 0{
                            DD = 1
                            Up(v: self)
                            UserDefaults.standard.set(5, forKey: "Show")
                        }else{
                            self.S()
                            UserDefaults.standard.set(g, forKey: "Show")
                        }
            
        }
     
    }
    @objc func S(){
        UIImageWriteToSavedPhotosAlbum((Collection_ClickView.visibleCells.first as! ClickView_CollectionViewCell).img_clickView.image!, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    @objc func image(_ image: UIImage, didFinishSavingWithError error: NSError?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            
            let ac = UIAlertController(title: "Save error", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        } else {
            
            let ac = UIAlertController(title: "Saved!", message: "The screenshot has been saved to your photos.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }
 
=======
    var tempPath = ""
    @IBOutlet weak var Collection_ClickView: UICollectionView!
    @IBAction func abtn_BacktoCate(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func btnDownload(_ sender: Any) {
        UIImageWriteToSavedPhotosAlbum((Collection_ClickView.visibleCells.first as! ClickView_CollectionViewCell).img_clickView.image!, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
     
    }
    
    @objc func image(_ image: UIImage, didFinishSavingWithError error: NSError?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            
            let ac = UIAlertController(title: "Save error", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        } else {
            
            let ac = UIAlertController(title: "Saved!", message: "The screenshot has been saved to your photos.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }
    
    
    func ViewWillDisappear(_ animated: Bool) {
        do{
            try? documentsURL.removeItem(atPath: tempPath)
        }
        catch{
            print("can't remove")
            
        }
    }
     let documentsURL = FileManager.default
>>>>>>> 448d4ba881ec20425d0a2a44225b3512f98b7080
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(loadprogress(_:)), name: .ClickLoadpercent_wallpaperHome, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(reloadclickView), name: .CategoriesDownload, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(S), name: .SWClick, object: nil)
        self.view.setGradients(color_01: UIColor(displayP3Red: 51/255, green: 50/255, blue: 55/255, alpha: 1.0), color_02: UIColor(displayP3Red: 11/255, green: 1/255, blue: 1/255, alpha: 1.0))
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.disconected()
        
    }
    
    
    @objc func loadprogress(_ notification: Notification){
        DispatchQueue.main.async {
            
            if let data = notification.userInfo as? [String: Any]
            {
                print(data["index"] as! Int)
            }
            
            guard let data = notification.userInfo as? [String: Any] else{
                return
            }
            
            guard let index = data["index"] as? Int else{
                return
            }
            
            guard let precent = data["precent"] as? CGFloat else{
                return
            }
            
            
            if index == self.Collection_ClickView.indexPath(for: self.Collection_ClickView.visibleCells.first!)?.row{
                let cell = (self.Collection_ClickView.visibleCells.first) as! ClickView_CollectionViewCell
                cell.shapeLayer.isHidden = false
                cell.pulsatingLayer.isHidden = false
                cell.trackLayer.isHidden = false
                cell.percentageLabel.isHidden = false
                
                
                cell.percentageLabel.text = "\(Int(precent * 100))% "
                cell.shapeLayer.strokeEnd = precent
                
                if precent == 1{
                    UIView.animate(withDuration: 1) {
                        cell.percentageLabel.isHidden = true
                        cell.shapeLayer.strokeEnd = 0
                        cell.shapeLayer.isHidden = true
                        cell.pulsatingLayer.isHidden = true
                        cell.trackLayer.isHidden = false
                        
                    }
                }
                else{
                    
                    UIView.animate(withDuration: 1) {
                        cell.percentageLabel.isHidden = false
                        
                    }
                }
            }
        }
    }
    lazy var downloadPhotoQueue:OperationQueue = {
        let queue = OperationQueue()
        queue.name = "Download Photo"
        queue.maxConcurrentOperationCount = 2
        return queue
    }()
    
    var downloadingTasks = Dictionary<IndexPath,Operation>()
    let photoCache:NSCache<AnyObject,AnyObject> = NSCache<AnyObject,AnyObject>()
    
    override func viewWillAppear(_ animated: Bool) {
//        reloadclickView()
        GoogleAdMob.sharedInstance.view = self
        RE.sharedInstanceRE.view = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        reloadclickView()
       
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
<<<<<<< HEAD
        
        return PhotoCategoriesSeeAll.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Coll_ClickView", for: indexPath) as! ClickView_CollectionViewCell
        let userPhoto = PhotoCategoriesSeeAll[indexPath.row]
        let keyCache = userPhoto.id
        let DocumentsURL = FileManager.default
        let Manager = DocumentsURL.urls(for: .documentDirectory, in: .allDomainsMask).first!
        let filePath = Manager.appendingPathComponent(keyCache).appendingPathExtension("jpg")

        cell.shapeLayer.strokeEnd = 0
        cell.shapeLayer.isHidden = true
        cell.pulsatingLayer.isHidden = true
        cell.trackLayer.isHidden = true
        cell.percentageLabel.isHidden = true
        
        if UIImage(contentsOfFile: filePath.path) != nil{
            
            cell.contentView.bringSubview(toFront: cell.img_clickView)
            cell.img_clickView.image = UIImage(contentsOfFile: filePath.path)!
            cell.downloaded = true
            
            
        }else{
            
            if let downloadedIMG = photoCache.object(forKey: keyCache as AnyObject) as? UIImage{
                cell.contentView.bringSubview(toFront: cell.img_clickView)
                cell.img_clickView.image = downloadedIMG
                
                cell.downloaded = true
                
                if let data = UIImageJPEGRepresentation(cell.img_clickView.image!, 1.0)
                {
                    do {
                        // writes the image data to disk
                        
                        
                        
                        try data.write(to: filePath )
                        //                                loadprogress()
                        print("file saved")
                        
                    } catch {
                        print("error saving file:", error)
                        
                    }
                }
            }else {
                cell.layoutIfNeeded()
                cell.downloaded = false
                if let label = cell.contentView.viewWithTag(10) as? UILabel{
                    label.removeFromSuperview()
                }
                if let sublayers = cell.contentView.layer.sublayers{
                    for sublayer in sublayers{
                        if sublayer.name == "shapeLayer" || sublayer.name == "pulsatingLayer" || sublayer.name == "trackLayer"{
                            sublayer.removeFromSuperlayer()
=======
        print(json_categories_SeeAll)
        return json_categories_SeeAll.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Coll_ClickView", for: indexPath) as! ClickView_CollectionViewCell
       
        let manager = documentsURL.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        let filePath = manager.appendingPathComponent("\(dictionary_cate)-\(indexPath.row + 1).jpg").path

        if UIImage(contentsOfFile: filePath) != nil {
            cell.img_clickView.image = UIImage(contentsOfFile: filePath)
        }else{
            
            
            let downloading = DispatchQueue(label: "downloading")
            downloading.async {
                let url = URL(string: json_categories_SeeAll[indexPath.row])
              
                if let data = try? Data(contentsOf: url!){
                    if let image = UIImage(data: data){
                        DispatchQueue.main.async {
                            
                            cell.img_clickView.image = image
                            
                            WallpaperCoreData.share.saveData(index: json_idCategories_SeeAll[indexPath.row])
                            
                            do {
                                
                                let fileURL = manager.appendingPathComponent("\(WallpaperCoreData.share.getID()).jpg").path
                                self.tempPath = fileURL
                                print(fileURL)
                                if let jpgData = UIImageJPEGRepresentation(UIImage(data: data)!, 1.0){
                                    try? jpgData.write(to:manager , options: .atomic)
                                }
                                
                            } catch { }
>>>>>>> 448d4ba881ec20425d0a2a44225b3512f98b7080
                        }
                    }
                }
                
                cell.setupCircleLayers()
                cell.setupPercentageLabel()
                cell.shapeLayer.isHidden = false
                cell.pulsatingLayer.isHidden = false
                cell.trackLayer.isHidden = false
                cell.percentageLabel.isHidden = false
                
                cell.img_clickView.image =  #imageLiteral(resourceName: "catch")
                
                cell.shapeLayer.strokeEnd = 0
                
                cell.percentageLabel.text = "0%"
                
                
                if !collectionView.isDecelerating {
                    let id = IndexPath(item: indexPath.row, section: 0)
                    let downloadPhoto = DownloadPhotoOperation(indexPath: id, photoURL: userPhoto.link, needPercent: 2, delegate: self as DownloadPhotoOperationDelegate)
                    startDownloadImage(operation: downloadPhoto, indexPath: id)
                    
                    
                }
            }
        }
<<<<<<< HEAD
        cell.frame.origin.y = self.Collection_ClickView.bounds.origin.y
            return cell
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
=======
        
            return cell
>>>>>>> 448d4ba881ec20425d0a2a44225b3512f98b7080
    }
//        let downloading = DispatchQueue.global()
//        downloading.async {
//
//            let url = URL(string: json_categories_SeeAll[indexPath.row])
//
//            if let data = try? Data(contentsOf: url!) {
//
//                if let image = UIImage(data: data){
//                    DispatchQueue.main.async {
//                        cell.img_clickView.image = image
//                    }
//                }
//            }
//        }

    
<<<<<<< HEAD
    var onceOnly = false
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if !onceOnly {
            let indexToScrollTo = temp
            self.Collection_ClickView.scrollToItem(at: indexToScrollTo, at: .left, animated: false)
            onceOnly = true
        }
    }
 
    @objc func reloadclickView(){
    
//    Collection_ClickView.reloadData()
//    Collection_ClickView.scrollToItem(at: temp, at: UICollectionViewScrollPosition.right, animated: false)
    }
    func reloadVisibleCells() {
        UIView.setAnimationsEnabled(false)
        self.Collection_ClickView.performBatchUpdates({
            
            let visibleCellIndexPaths = self.Collection_ClickView.indexPathsForVisibleItems
            self.Collection_ClickView.reloadItems(at: visibleCellIndexPaths)
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
    
    func startDownloadImage(operation:DownloadPhotoOperation, indexPath: IndexPath) {
        
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
        print("VaoDis")
        for download in downloadingTasks{
            if (download.value as! DownloadPhotoOperation).downloadtask?.state == .running{
                (download.value as! DownloadPhotoOperation).downloadtask?.cancel()
            }
            
        }
        downloadPhotoQueue.cancelAllOperations()
        
        downloadingTasks.removeAll()
        print("RaDis")
=======
    static func deleteFiledInDocDirectory(tempFolderPath:URL){
        
        let fileManager = FileManager.default
        guard let tempFolderPath = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first?.absoluteString else {
            return   // documents directory not found for some reason
        }
        do {
            let filePaths = try fileManager.contentsOfDirectory(atPath: tempFolderPath)
            for filePath in filePaths {
                try fileManager.removeItem(atPath: tempFolderPath + filePath)
            }
        } catch {
            print("Could not clear temp folder: \(error)")
        }
    }
    @objc func reloadclickView(){
    
    Collection_ClickView.reloadData()
>>>>>>> 448d4ba881ec20425d0a2a44225b3512f98b7080
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: Collection_ClickView.bounds.width, height: Collection_ClickView.bounds.height)
    }
    
<<<<<<< HEAD
}
extension ClickImageCateView: DownloadPhotoOperationDelegate {
    
    func downloadPhotoDidFail(operation: DownloadPhotoOperation) {
        
    }
    
    func downloadPhotoDidFinish(operation:DownloadPhotoOperation, image:UIImage) {
        
        let userPhoto = PhotoCategoriesSeeAll[operation.indexPath.item]
        let keyCache = userPhoto.id
        
        self.photoCache.setObject(image, forKey: keyCache as AnyObject)
        
        
        let id = IndexPath(item: operation.indexPath.row, section: 0)
        
        self.Collection_ClickView.reloadItems(at: [id])
        
        downloadingTasks.removeValue(forKey: operation.indexPath)
    }
=======
>>>>>>> 448d4ba881ec20425d0a2a44225b3512f98b7080
}

