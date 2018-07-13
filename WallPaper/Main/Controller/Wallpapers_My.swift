//
//  Wallpapers_My.swift
//  WallPaper
//
//  Created by 5k on 6/7/18.
//  Copyright © 2018 NatsuSalamada. All rights reserved.
//

import UIKit
var indexLibrary = IndexPath()
class Wallpapers_My: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if UIScreen.main.bounds.width >= 768{
            
            return CGSize(width: WIPA(w: 184), height: HIPA(h: 212))
            
            
        }else{
            
            return CGSize(width: WIPH(w: 93), height: HIPH(h: 152))
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array_Image_library.count
    }
    
   @objc func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Wallpapers_Cell", for: indexPath) as! CollViewCell1
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        var space: CGFloat = 0.0
        cell.img_Library.image = array_Image_library[indexPath.row] 
        if UIScreen.main.bounds.width >= 768{
            space = WIPA(w: 14)
        }else{
            
            space = WIPH(w: 0)
        }
        var minimumLine:CGFloat = 0
        if UIScreen.main.bounds.width >= 768{
            
            minimumLine = WIPH(w: 1)
            
        }else{
            minimumLine = WIPH(w: 1)
        }
        if UIScreen.main.bounds.width >= 768{
            
            layout.minimumInteritemSpacing = 0
            layout.sectionInset = UIEdgeInsetsMake(0, space, 0, space)
            layout.minimumLineSpacing = minimumLine
            
        }else{
            
            layout.minimumInteritemSpacing = 1
        }
        return cell
    }
    
    @objc func reloadcollection(){
        Wallpapers_Coll.reloadData()
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        indexLibrary = indexPath
    }
    @IBOutlet weak var Wallpapers_Coll: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(reloadcollection), name: .LibaryWallpaper, object: nil)
    }
}
extension Notification.Name{
    static let LibaryWallpaper = Notification.Name("Downloading")
}