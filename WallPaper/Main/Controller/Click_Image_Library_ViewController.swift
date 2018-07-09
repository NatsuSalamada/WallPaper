//
//  Click_Image_Library_ViewController.swift
//  WallPaper
//
//  Created by User on 7/9/18.
//  Copyright © 2018 NatsuSalamada. All rights reserved.
//

import UIKit

class Click_Image_Library_ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var Collection_library: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return array_Image_library.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell_Library", for: indexPath) as! Click_Library_CollectionViewCell
        
        print(array_Image_library[indexPath.row])
        cell.img_Library.image = array_Image_library[indexPath.row]
            
        return cell
    }
    
    @IBAction func abtn_ClickLibrary_cancle(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Collection_library.bounds.width, height: Collection_library.bounds.height)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        Collection_library.reloadData()
    }


}
