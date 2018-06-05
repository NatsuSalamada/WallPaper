//
//  CategogiesView.swift
//  WallPaper
//
//  Created by User on 6/4/18.
//  Copyright © 2018 NatsuSalamada. All rights reserved.
//

import UIKit

class CategogiesView: UIViewController ,UITableViewDelegate,UITableViewDataSource {
    
    var img = ["hinh1","hinh2","hinh3","hinh4","hinh5"]
    
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
        var cell = UITableViewCell()
        if indexPath.row == 0 || indexPath.row == 2 || indexPath.row == 4{
            cell = tableView.dequeueReusableCell(withIdentifier: "CellLbl", for: indexPath) as! Name_Cate_TableViewCell
        }else if indexPath.row == 1 || indexPath.row == 3{
            cell = tableView.dequeueReusableCell(withIdentifier: "Cell_H", for: indexPath) as! Collection_H_TableViewCell
        }else{
            cell = tableView.dequeueReusableCell(withIdentifier: "Cell_V", for: indexPath) as! Collection_V_TableViewCell
        }
        return cell
    }
//    // Collectionview Delegate
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return img.count
//    }
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cellimg", for: indexPath) as! CategogiesCollectionView
//        cell.Image.image = UIImage(named: img[indexPath.row])
//
//        return cell
//    }
}

  




