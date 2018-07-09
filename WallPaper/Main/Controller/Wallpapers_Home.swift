//
//  Wallpapers_Home.swift
//  WallPaper
//
//  Created by 5k on 6/6/18.
//  Copyright © 2018 NatsuSalamada. All rights reserved.
//

import UIKit

class Wallpapers_Home: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
  
    
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
        print(indexPath.row)
       
        
        let downloading = DispatchQueue(label: "downloading")
            downloading.async {
                 let url = URL(string: json_imageHome[indexPath.row])
                let data = try? Data(contentsOf: url!)
                DispatchQueue.main.async {
                    cell.Img_Home.image = UIImage(data: data!)
                    
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

    @IBOutlet weak var CollView_WallHome: UICollectionView!
   

    

}
extension Notification.Name{
    static let ImageHomeDownload = Notification.Name("Downloading")
}
