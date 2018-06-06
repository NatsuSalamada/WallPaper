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
enum CellCollectionCateType:Int {
    case Cell_H = 0
    case Coll_V = 1
}

class CategogiesView: UIViewController ,UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegate {
    
    var img = ["hinh1","hinh2","hinh3","hinh4","hinh5","hinh1","hinh2","hinh3","hinh4","hinh5"]
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 || indexPath.row == 2 || indexPath.row == 4{
            return 33
            
        }else if indexPath.row == 1 || indexPath.row == 3{
            return 200
        }else{
            return 317
        }
        
    }
    // Tableview Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       
        
        if indexPath.row == 0 || indexPath.row == 2 || indexPath.row == 4{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellLbl", for: indexPath) as! Name_Cate_TableViewCell
            
            if indexPath.row == 0{
               cell.lbl_Name.text = "New Arrivals"
              
            }else if indexPath.row == 2{
                cell.lbl_Name.text = "Popular"
            
            }else if indexPath.row == 4{
                 cell.lbl_Name.text = "Categories"
            
            }
        
            return cell
           
        }else if indexPath.row == 1 || indexPath.row == 3{
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell_H", for: indexPath) as! Collection_H_TableViewCell
            
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell_V", for: indexPath) as! Collection_V_TableViewCell
            
            return cell
        }
        
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return img.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        
      
        
        if collectionView.tag == CellCollectionCateType.Cell_H.rawValue{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellCollectionCate.Cell_H, for: indexPath) as! Horizontal_CollectionView
           cell.H_Image.image = UIImage(named: img[indexPath.row])
            return cell
            
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellCollectionCate.Cell_V, for: indexPath) as! Vertical_CollectionView
            cell.V_Image.image = UIImage(named: img[indexPath.row])
            return cell
        }
        
       
    }

    
}



