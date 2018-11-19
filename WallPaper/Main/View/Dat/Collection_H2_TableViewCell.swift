//
//  Collection_H2_TableViewCell.swift
//  WallPaper
//
//  Created by Bé Nhện Của Bé Thảo on 20/08/2018.
//  Copyright © 2018 NatsuSalamada. All rights reserved.
//

import UIKit

class Collection_H2_TableViewCell: UITableViewCell {

    @IBOutlet weak var H_Collection: UICollectionView!
    @objc func reload_Horizal_Popular_SeeAll(){
        H_Collection.reloadData()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        NotificationCenter.default.addObserver(self, selector: #selector(reload_Horizal_Popular_SeeAll), name: .Popular_SeeAll, object: nil)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
