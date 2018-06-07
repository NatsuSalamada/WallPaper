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

class CategogiesView: UIViewController ,UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    var img = ["hinh1","hinh2","hinh3","hinh4","hinh5","hinh1","hinh2","hinh3","hinh4","hinh5"]
  
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
      self.view.setGradients(color_01: UIColor(displayP3Red: 51/255, green: 50/255, blue: 55/255, alpha: 1.0), color_02: UIColor(displayP3Red: 11/255, green: 1/255, blue: 1/255, alpha: 1.0))
    }
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 16
        }else if indexPath.row == 3 || indexPath.row == 6{
            return 32
        }else if indexPath.row == 1 || indexPath.row == 4 || indexPath.row == 7{
            return 37
        }
        else if indexPath.row == 2 || indexPath.row == 5{
            return 200
        }else{
            return 317
        }
        
    }
    // Tableview Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       
        
        if indexPath.row == 1 || indexPath.row == 4 || indexPath.row == 7{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellLbl", for: indexPath) as! Name_Cate_TableViewCell
           
            if indexPath.row == 1{
               cell.lbl_Name.text = "New Arrivals"
              
            }else if indexPath.row == 4{
                cell.lbl_Name.text = "Popular"
            
            }else if indexPath.row == 7{
                 cell.lbl_Name.text = "Categories"
            
            }
         cell.selectionStyle = .none
            return cell
           
        }else if indexPath.row == 2 || indexPath.row == 5{
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell_H", for: indexPath) as! Collection_H_TableViewCell
           cell.selectionStyle = .none
        
            return cell
        }else if indexPath.row == 0 || indexPath.row == 3 || indexPath.row == 6 {
             let cell = tableView.dequeueReusableCell(withIdentifier: "Cell_None", for: indexPath) as! None_TableViewCell
            cell.selectionStyle = .none
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell_V", for: indexPath) as! Collection_V_TableViewCell
            cell.selectionStyle = .none
            return cell
        }
        
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return img.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        var raDius:CGFloat = 0.0
        var space: CGFloat = 0.0
        if UIScreen.main.bounds.width >= 768{
            
            raDius = WIPA(w: 4 )
            space = WIPA(w: 24)
            
        }else{
            raDius = WIPH(w: 4)
            space = WIPH(w: 24)
        }
       var layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout

        
        if collectionView.tag == CellCollectionCateType.Cell_H.rawValue{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellCollectionCate.Cell_H, for: indexPath) as! Horizontal_CollectionView
           
           cell.H_Image.image = UIImage(named: img[indexPath.row])
            
            cell.layer.cornerRadius = raDius
            cell.clipsToBounds = true
            layout.sectionInset = UIEdgeInsetsMake(0, space, 0, 0)
            layout.itemSize = CGSize(width: 113, height: 200)
            layout.minimumInteritemSpacing = 8
            layout.scrollDirection = .horizontal
     
           
            return cell
            
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellCollectionCate.Cell_V, for: indexPath) as! Vertical_CollectionView
            
                cell.V_Image.image = UIImage(named: img[indexPath.row])
          
            cell.layer.cornerRadius = raDius
            cell.clipsToBounds = true
            
            layout.sectionInset = UIEdgeInsetsMake(0, space, 0,space)
            layout.itemSize = CGSize(width: 160, height: 57)
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 8
             layout.scrollDirection = .vertical
            return cell
        }
        
       
    }

    
}



