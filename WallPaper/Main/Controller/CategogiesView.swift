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
    var lbl = ["Abstract","Animals","Cities","Science","Flowers","Sports","Mountains","Underwater","Nature","Other"]
   
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.setGradients(color_01: UIColor(displayP3Red: 51/255, green: 50/255, blue: 55/255, alpha: 1.0), color_02: UIColor(displayP3Red: 11/255, green: 1/255, blue: 1/255, alpha: 1.0))
        getJson_CategoriesIcon.sharedInstance.fetchFeedForUrlString()
        
       
    }
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height:CGFloat = 0
        
        if indexPath.row == 0 {
            if UIScreen.main.bounds.width >= 768{
                
                height = HIPA(h: 30)
                return height
                
            }else{
                height = HIPH(h: 16)
                return height
            }
        }else if indexPath.row == 3 || indexPath.row == 6{
            if UIScreen.main.bounds.width >= 768{
                
                height = HIPA(h: 28)
                return height
                
            }else{
                height = HIPH(h: 28)
                return height
            }
        }else if indexPath.row == 1 || indexPath.row == 4 || indexPath.row == 7{
            if UIScreen.main.bounds.width >= 768{
                
                height = HIPA(h: 48)
                return height
                
            }else{
                height = HIPH(h: 37)
                return height
            }
        }
        else if indexPath.row == 2 || indexPath.row == 5{
            if UIScreen.main.bounds.width >= 768{
                
                height = HIPA(h: 307)
                return height
                
            }else{
                height = HIPH(h: 200)
                return height
            }
        }else{
            if UIScreen.main.bounds.width >= 768{
                
                height = HIPA(h: 187)
                return height
                
            }else{
                height = HIPH(h: 317)
                return height
            }
        }
        
    }
    // Tableview Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       
        
        if indexPath.row == 1 || indexPath.row == 4 || indexPath.row == 7{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellLbl", for: indexPath) as! Name_Cate_TableViewCell
            if indexPath.row == 1 || indexPath.row == 4{
            cell.btn_Name.set(image: #imageLiteral(resourceName: "iconArrow"), title: "SEE ALL", titlePosition: .left, additionalSpacing: 8, state: .normal)
            cell.btn_Name.tintColor = UIColor.white
            }
            
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
        if collectionView.tag == CellCollectionCateType.Cell_H.rawValue{
            return img.count
        }
        return json_categoriesicon.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        var raDius:CGFloat = 0.0
        var space: CGFloat = 0.0
        
        if UIScreen.main.bounds.width >= 768{
            
            raDius = WIPA(w: 6)
            space = WIPA(w: 40)
           
            
        }else{
            raDius = WIPH(w: 4)
            space = WIPH(w: 24)
        }
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout

        
        if collectionView.tag == CellCollectionCateType.Cell_H.rawValue{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellCollectionCate.Cell_H, for: indexPath) as! Horizontal_CollectionView
           
            cell.H_Image.image = UIImage(named: img[indexPath.row])
            cell.layer.cornerRadius = raDius
            cell.clipsToBounds = true
            layout.sectionInset = UIEdgeInsetsMake(0, space, 0, 0)
            layout.itemSize = CGSize(width: 113, height: 200)
           
            layout.minimumLineSpacing = 8
            
            
            layout.scrollDirection = .horizontal
     
           
            return cell
            
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellCollectionCate.Cell_V, for: indexPath) as! Vertical_CollectionView
            
            
          cell.Lbl_NameCate.text = lbl[indexPath.row]
            cell.layer.cornerRadius = raDius
            cell.clipsToBounds = true
            layout.sectionInset = UIEdgeInsetsMake(0, space, 0,space)
            layout.itemSize = CGSize(width: 160, height: 57)
            layout.minimumInteritemSpacing = 0
            var minimumLine:CGFloat = 0
            if UIScreen.main.bounds.width >= 768{
                
                minimumLine = 8
                
                
            }else{
                minimumLine = WIPH(w: UIScreen.main.bounds.width - space*2 - cell.bounds.size.width*2)
            }
            
            layout.minimumLineSpacing = minimumLine
             layout.scrollDirection = .vertical
            
           
            let downloading = DispatchQueue(label: "downloading")
            downloading.async {
                if let url = URL(string: json_categoriesicon[indexPath.row]){
                    if  let data = try? Data(contentsOf: url){
                        DispatchQueue.main.async {
                            cell.V_Image.image = UIImage(data: data)
                        }
                    }
                }
               
               
                
            }
            return cell
        }
        
       
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       dictionary_cate.removeAll()
       dictionary_cate = categories[indexPath.row]
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var sizeCell_H:CGSize = CGSize.zero
        var sizeCell_V:CGSize = CGSize.zero
        if UIScreen.main.bounds.width >= 768{
            
            sizeCell_V = CGSize(width: WIPA(w: 166), height: HIPA(h: 57))
            sizeCell_H = CGSize(width: WIPA(w: 230), height: HIPA(h: 307))
            
        }else{
           sizeCell_V = CGSize(width: WIPH(w: 160), height: HIPH(h: 57))
            sizeCell_H = CGSize(width: WIPH(w: 113), height: HIPH(h: 200))
        }
        if collectionView.tag == CellCollectionCateType.Cell_H.rawValue{
            return sizeCell_H
        }else{
            return sizeCell_V
        }
            
    }
    
}


