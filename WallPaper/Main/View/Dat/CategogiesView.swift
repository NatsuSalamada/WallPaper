//
//  CategogiesView.swift
//  WallPaper
//
//  Created by User on 6/4/18.
//  Copyright © 2018 NatsuSalamada. All rights reserved.
//

import UIKit

struct CellCollectionCate {
    static let Cell_H = "Coll_H"
    static let Cell_V = "Coll_V"
}

class CategogiesView: UIViewController ,UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegate {
    
    var img = ["hinh1","hinh2","hinh3","hinh4","hinh5"]
    
    var identifier = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    // Tableview Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       
        
        if indexPath.row == 0 || indexPath.row == 2 || indexPath.row == 4{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellLbl", for: indexPath) as! Name_Cate_TableViewCell
            return cell
           
        }else if indexPath.row == 1 || indexPath.row == 3{
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell_H", for: indexPath) as! Collection_H_TableViewCell
            self.identifier = CellCollectionCate.Cell_H
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell_V", for: indexPath) as! Collection_V_TableViewCell
            self.identifier = CellCollectionCate.Cell_V
            return cell
        }
        
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return img.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        if identifier == CellCollectionCate.Cell_H{
            if let Cell_H_Collection = cell as? Horizontal_CollectionView{
                Cell_H_Collection.H_Image.image = UIImage(named: img[indexPath.row])
            }
        }else{
            if let Cell_V_Collection = cell as? Vertical_CollectionView{
                
            }
        }
        
        return cell
    }

    
}



