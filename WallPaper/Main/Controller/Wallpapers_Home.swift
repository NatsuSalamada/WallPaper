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
    
    var WallpaperData:[Images] = []
   @IBOutlet weak var CollView_WallHome: UICollectionView!
    @IBAction func btnDownload(_ sender: Any) {
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
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      getJson_HomeImage.sharedInstance.fetchFeedForUrlString()
        NotificationCenter.default.addObserver(self, selector: #selector(reload), name: .ImageHomeDownload, object: nil)
       
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return json_imageHome.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell_WallpapersHome", for: indexPath) as! CollViewCell_Home

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
        	
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CollView_WallHome.bounds.width, height: CollView_WallHome.bounds.height)
    }
    

    @objc func reload(){
        
        CollView_WallHome.reloadData()
    }

   
   

    

}
extension Notification.Name{
    static let ImageHomeDownload = Notification.Name("Downloading")
}
