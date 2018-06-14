//
//  LiveWallpapers_SeeAll.swift
//  WallPaper
//
//  Created by 5k on 6/8/18.
//  Copyright © 2018 NatsuSalamada. All rights reserved.
//

import UIKit

class LiveWallpapers_SeeAll: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LiveWallpapers_Cell", for: indexPath) as! CollViewCell1
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        var space: CGFloat = 0.0
        
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
            
            layout.minimumInteritemSpacing = 1
            layout.sectionInset = UIEdgeInsetsMake(0, space, 0, space)
            layout.minimumLineSpacing = minimumLine
            
        }else{
            
            layout.minimumInteritemSpacing = 1
        }
        
        return  cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if UIScreen.main.bounds.width >= 768{
            
            return CGSize(width: WIPA(w: 184), height: HIPA(h: 212))
            
            
        }else{
            
            return CGSize(width: WIPH(w: 93), height: HIPH(h: 152))
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
