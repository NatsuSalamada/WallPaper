//
//  Wallpapers_Home.swift
//  WallPaper
//
//  Created by 5k on 6/6/18.
//  Copyright © 2018 NatsuSalamada. All rights reserved.
//

import UIKit
import CoreData

class Wallpapers_Home: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
<<<<<<< HEAD
    
    
    
    lazy var downloadPhotoQueue:OperationQueue = {
        let queue = OperationQueue()
        queue.name = "Download Photo"
        queue.maxConcurrentOperationCount = 2
        return queue
    }()
    
    var downloadingTasks = Dictionary<IndexPath,Operation>()
    let photoCache:NSCache<AnyObject,AnyObject> = NSCache<AnyObject,AnyObject>()
    
    @IBOutlet weak var CollView_WallHome: UICollectionView!
    
    @objc func btnDownload(_ sender: UIButton!) {
        guard let cell = (CollView_WallHome.visibleCells.first as? CollViewCell_Home) else {
            return
        }
        
        if cell.downloaded{
            var g = UserDefaults.standard.value(forKey: "Show") as! Int
            g = g - 1
            if g == 0{
                DD = 0
                Up(v: self)
                UserDefaults.standard.set(5, forKey: "Show")
            }else{
                self.S()
                UserDefaults.standard.set(g, forKey: "Show")
            }
//            DD = 0
//            Up(v: self)
            
        }
        
    }
    @objc func S(){
=======
    var WallpaperData:[Images] = []
   @IBOutlet weak var CollView_WallHome: UICollectionView!
    @IBAction func btnDownload(_ sender: Any) {
>>>>>>> 448d4ba881ec20425d0a2a44225b3512f98b7080
        UIImageWriteToSavedPhotosAlbum((CollView_WallHome.visibleCells.first as! CollViewCell_Home).Img_Home.image!, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
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
    
    
    
<<<<<<< HEAD
    
    var btnDownload:UIButton = {
        let btnDownload = UIButton()
        btnDownload.setImage( #imageLiteral(resourceName: "saveBtn"), for: .normal)
        btnDownload.addTarget(self, action: #selector(btnDownload(_:)), for: .touchUpInside)
        return btnDownload
    }()
    
    
    
    
    
    
    
    //kjhgfghjkmnbgyuikmnbgjmnbghjmnb
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        NotificationCenter.default.addObserver(self, selector: #selector(loadprogress(_:)), name: .Loadpercent_wallpaperHome, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(S), name: .SWHome, object: nil)
        
        view.addSubview(btnDownload)
        
        
        btnDownload.frame = CGRect(x: (view.frame.size.width/2)-50.5, y: view.frame.size.height-HIPH(h: 93)
            , width: 101, height: 48)

        
        self.view.backgroundColor = UIColor.rgb(r: 70, g: 70, b: 70)
        
        
        
        
        
        //kjhgfghjkmnbgyuikmnbgjmnbghjmnb
        
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        CollView_WallHome.reloadData()
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
            
            
            if index == self.CollView_WallHome.indexPath(for: self.CollView_WallHome.visibleCells.first!)?.row{
                let cell = (self.CollView_WallHome.visibleCells.first) as! CollViewCell_Home
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return PhotoList.count
    }
=======
    
    override func viewDidLoad() {
        super.viewDidLoad()
      getJson_HomeImage.sharedInstance.fetchFeedForUrlString()
        NotificationCenter.default.addObserver(self, selector: #selector(reload), name: .ImageHomeDownload, object: nil)
       
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return json_imageHome.count
    }
>>>>>>> 448d4ba881ec20425d0a2a44225b3512f98b7080
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let userPhoto = PhotoList[indexPath.row]
        let keyCache = userPhoto.id
        let DocumentsURL = FileManager.default
        let Manager = DocumentsURL.urls(for: .documentDirectory, in: .allDomainsMask).first!
        let filePath = Manager.appendingPathComponent("\(keyCache).jpg")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell_WallpapersHome", for: indexPath) as! CollViewCell_Home
<<<<<<< HEAD
        
        cell.shapeLayer.strokeEnd = 0
        cell.shapeLayer.isHidden = true
        cell.pulsatingLayer.isHidden = true
        cell.trackLayer.isHidden = true
        cell.percentageLabel.isHidden = true
       
        if UIImage(contentsOfFile: filePath.path) != nil{
            
            cell.contentView.bringSubview(toFront: cell.Img_Home)
            cell.Img_Home.image = UIImage(contentsOfFile: filePath.path)!
            cell.downloaded = true
            

        }else{
            
            if let downloadedIMG = photoCache.object(forKey: keyCache as AnyObject) as? UIImage{
                 cell.contentView.bringSubview(toFront: cell.Img_Home)
                cell.Img_Home.image = downloadedIMG
                cell.downloaded = true
              
                
                if let data = UIImageJPEGRepresentation(cell.Img_Home.image!, 1.0)
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
                        }
                    }
                }
                
                cell.setupCircleLayers()
                cell.setupPercentageLabel()
                cell.shapeLayer.isHidden = false
                cell.pulsatingLayer.isHidden = false
                cell.trackLayer.isHidden = false
                cell.percentageLabel.isHidden = false
                
                cell.Img_Home.image =  #imageLiteral(resourceName: "catch")
                
                cell.shapeLayer.strokeEnd = 0
                
                cell.percentageLabel.text = "0%"
                
                
                if !collectionView.isDecelerating {
                    let id = IndexPath(item: indexPath.row, section: 0)
                    let downloadPhoto = DownloadPhotoOperation(indexPath: id, photoURL: userPhoto.link, needPercent: 1, delegate: self as DownloadPhotoOperationDelegate)
                    startDownloadImage(operation: downloadPhoto, indexPath: id)
            
=======

        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let filePath = documentsURL.appendingPathComponent("Home\(indexPath.row + 1).jpg").path
        
        if UIImage(contentsOfFile: filePath) != nil{
            cell.Img_Home.image = UIImage(contentsOfFile: filePath)
        }else{
            let downloading = DispatchQueue(label: "downloading")
            downloading.async {
                let url = URL(string: json_imageHome[indexPath.row])
                let data = try? Data(contentsOf: url!)
                DispatchQueue.main.async {
                    cell.Img_Home.image = UIImage(data: data!)
                    print(json_idImageHome[indexPath.row])
                    WallpaperCoreData.share.saveData(index: json_idImageHome[indexPath.row])
>>>>>>> 448d4ba881ec20425d0a2a44225b3512f98b7080
                    
                    do {
                        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
                        
                        
                        let fileURL = documentsURL.appendingPathComponent("\(WallpaperCoreData.share.getID()).jpg")
                        
                        
                        if let pngImageData = UIImagePNGRepresentation(UIImage(data: data!)!) {
                            try pngImageData.write(to: fileURL, options: .atomic)
                        }
                    } catch { }
        }
                }
                
            }
<<<<<<< HEAD
        }
       
        cell.frame.origin.y = self.CollView_WallHome.bounds.origin.y
=======
        	
>>>>>>> 448d4ba881ec20425d0a2a44225b3512f98b7080
        
        return cell
    }
    
    
    
    
    
    func reloadVisibleCells() {
        UIView.setAnimationsEnabled(false)
        self.CollView_WallHome.performBatchUpdates({
            
            let visibleCellIndexPaths = self.CollView_WallHome.indexPathsForVisibleItems
            self.CollView_WallHome.reloadItems(at: visibleCellIndexPaths)
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
//        print("VaoDis")
        for download in downloadingTasks{
            if (download.value as! DownloadPhotoOperation).downloadtask?.state == .running{
                (download.value as! DownloadPhotoOperation).downloadtask?.cancel()
            }
            
        }
        downloadPhotoQueue.cancelAllOperations()
        
        downloadingTasks.removeAll()
//        print("RaDis")
    }
    
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    //        return UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
    //    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.CollView_WallHome.frame.size.width, height: self.CollView_WallHome.frame.size.height)
    }
    
<<<<<<< HEAD
    
    
    
=======

>>>>>>> 448d4ba881ec20425d0a2a44225b3512f98b7080
    @objc func reload(){
        
        CollView_WallHome.reloadData()
        //        AnimateCircle()
        
    }
<<<<<<< HEAD
=======

   
   

>>>>>>> 448d4ba881ec20425d0a2a44225b3512f98b7080
    
}

extension Wallpapers_Home: DownloadPhotoOperationDelegate {
    
    func downloadPhotoDidFail(operation: DownloadPhotoOperation) {
        
    }
    
    func downloadPhotoDidFinish(operation:DownloadPhotoOperation, image:UIImage) {
        
        let userPhoto = PhotoList[operation.indexPath.item]
        let keyCache = userPhoto.id
        
        self.photoCache.setObject(image, forKey: keyCache as AnyObject)
        
        
        let id = IndexPath(item: operation.indexPath.row, section: 0)
        
        self.CollView_WallHome.reloadItems(at: [id])
        
        downloadingTasks.removeValue(forKey: operation.indexPath)
    }
}
//extension Wallpapers_Home{
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//}
