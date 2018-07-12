
//
//  Wallpapers_SeeAll.swift
//  WallPaper
//
//  Created by 5k on 6/8/18.
//  Copyright © 2018 NatsuSalamada. All rights reserved.
//

import UIKit
var temp:IndexPath = IndexPath()

class Wallpapers_SeeAll: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var coll_Categories_seeall: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
          getJson_CategoriesSeeAll.sharedInstance.fetchFeedForUrlString()
        NotificationCenter.default.addObserver(self, selector: #selector(reloadCategories), name: .CategoriesDownload, object: nil)
       
    }
 
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return json_categories_SeeAll.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Wallpapers_Cell", for: indexPath) as! CollViewCell1
  
        let downloading = DispatchQueue.global()
        downloading.async {
            let url = URL(string: json_categories_SeeAll[indexPath.row])
            if let data = try? Data(contentsOf: url!) {

                if let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        cell.img_categories_seeall.image = image
                        
                    }
                }
            }
        }
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        var space: CGFloat = 0.0
        
        if UIScreen.main.bounds.width >= 768{
            
         
            space = WIPA(w: 14)
            
            //////testtttttt
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
        return  cell
    }

    @objc func reloadCategories(){
    
    coll_Categories_seeall.reloadData()
}
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    temp = indexPath
    print(temp)
      
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if UIScreen.main.bounds.width >= 768{
            
            return CGSize(width: WIPA(w: 184), height: HIPA(h: 212))
            
            
        }else{
            
            return CGSize(width: WIPH(w: 93), height: HIPH(h: 152))
        }
    }
    
   
    
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
