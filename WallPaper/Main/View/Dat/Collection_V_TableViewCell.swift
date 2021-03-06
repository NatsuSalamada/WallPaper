//
//  Collection_V_TableViewCell.swift
//  WallPaper
//
//  Created by Bé Nhện Của Bé Thảo on 04/06/2018.
//  Copyright © 2018 NatsuSalamada. All rights reserved.
//

import UIKit

class Collection_V_TableViewCell: UITableViewCell {

    @IBOutlet weak var Collection_V: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        NotificationCenter.default.addObserver(self, selector: #selector(reload), name: .CategoriesDownload, object: nil)
    }
    @objc func reload(){
        Collection_V.reloadData()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func reloadVisibleCells() {
        UIView.setAnimationsEnabled(false)
        self.Collection_V.performBatchUpdates({
            
            let visibleCellIndexPaths = self.Collection_V.indexPathsForVisibleItems
            self.Collection_V.reloadItems(at: visibleCellIndexPaths)
        }) { (finished) in
            UIView.setAnimationsEnabled(true)
        }
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y + scrollView.bounds.size.height
        
        if offsetY >= scrollView.contentSize.height {
            //loadData(nextKeyId: nextKeyId)
        }
        reloadVisibleCells()
        
    }
}


