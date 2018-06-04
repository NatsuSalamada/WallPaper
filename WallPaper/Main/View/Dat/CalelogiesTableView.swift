//
//  CalelogiesTableView.swift
//  WallPaper
//
//  Created by User on 6/4/18.
//  Copyright © 2018 NatsuSalamada. All rights reserved.
//

import UIKit

class CalelogiesTableView: UITableViewCell {


    
   
    
    @IBOutlet weak var CollectiomIma: UICollectionView!
    @IBOutlet weak var CollectionCate: UICollectionView!
    @IBAction func aBtn_Image(_ sender: Any) {
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
   
}
extension CalelogiesTableView
{
    func  setCollectionDelegateDatasource
        <D: UICollectionViewDelegate & UICollectionViewDataSource>
        (_ DatasourceDelegate: D, forRow row:Int)
    {
        CollectiomIma.delegate = DatasourceDelegate
        CollectiomIma.dataSource = DatasourceDelegate
        CollectiomIma.reloadData()
    }
}
