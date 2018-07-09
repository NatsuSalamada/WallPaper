//
//  ClickImageCateView.swift
//  WallPaper
//
//  Created by User on 6/8/18.
//  Copyright © 2018 NatsuSalamada. All rights reserved.
//

import UIKit

class ClickImageCateView: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var Collection_ClickView: UICollectionView!
    @IBAction func abtn_BacktoCate(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        Collection_ClickView.reloadData()
    }
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
        return json_categories_SeeAll.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Coll_ClickView", for: indexPath) as! ClickView_CollectionViewCell
        
        let downloading = DispatchQueue.global()
        downloading.async {
            
            let url = URL(string: json_categories_SeeAll[indexPath.row])
            
            if let data = try? Data(contentsOf: url!) {
                
                if let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        cell.img_clickView.image = image
                    }
                }
            }
        }

        return cell
    }
    
    @objc func reloadclickView(){
    Collection_ClickView.reloadData()
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: Collection_ClickView.bounds.width, height: Collection_ClickView.bounds.height)
    }

}
