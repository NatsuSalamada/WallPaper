//
//  ClickImageCateView.swift
//  WallPaper
//
//  Created by User on 6/8/18.
//  Copyright © 2018 NatsuSalamada. All rights reserved.
//

import UIKit

class ClickImageCateView: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
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
    override func viewDidLoad() {
        super.viewDidLoad()
        getJson_CategoriesSeeAll.sharedInstance.fetchFeedForUrlString()
        NotificationCenter.default.addObserver(self, selector: #selector(reloadclickView), name: .CategoriesDownload, object: nil)
        
    }
    override func viewDidAppear(_ animated: Bool) {
        reloadclickView()
        Collection_ClickView.scrollToItem(at: temp, at: UICollectionViewScrollPosition.right, animated: false)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
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
                        }
                    }
                }
            }
        }
        
            return cell
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
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: Collection_ClickView.bounds.width, height: Collection_ClickView.bounds.height)
    }
    
}

