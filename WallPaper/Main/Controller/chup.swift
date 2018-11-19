//
//  chup.swift
//  WallPaper
//
//  Created by Bé Nhện Của Bé Thảo on 31/08/2018.
//  Copyright © 2018 NatsuSalamada. All rights reserved.
//

import UIKit

class chup: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var Col_Chup: UICollectionView!
    var btnDownload:UIButton = {
        let btnDownload = UIButton()
        btnDownload.setImage( #imageLiteral(resourceName: "saveBtn"), for: .normal)
        btnDownload.addTarget(self, action: #selector(btnDownload(_:)), for: .touchUpInside)
        return btnDownload
    }()
    
    
    @objc func btnDownload(_ sender: UIButton!) {
        guard let cell = (Col_Chup.visibleCells.first as? chupcell) else {
            return
        }
        
       let index = Col_Chup.indexPath(for: cell)?.row
       
        cell.exportLivePhoto(mov: LivePhoToMyCoreData.share.getAllData()[index!].linkDataMOV!, jpg:  LivePhoToMyCoreData.share.getAllData()[index!].linkDataIMG!)
        
    }
    @IBAction func exit(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        GoogleAdMob.sharedInstance.view = nil
        RE.sharedInstanceRE.view = nil
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return LivePhoToMyCoreData.share.getAllData().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "chupcell", for: indexPath) as! chupcell
        cell.livephoto.livePhoto = livePhotoMyTemp["LiveMy\(String(describing: LivePhoToMyCoreData.share.getAllData()[indexPath.row].id!))"]?.livePhoto
        cell.livephoto.isMuted = true
        cell.frame.origin.y = self.Col_Chup.bounds.origin.y
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.bounds.size.width, height:self.view.bounds.size.height)
    }

    var onceOnly = false
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if !onceOnly {
            let indexToScrollTo = temp
            self.Col_Chup.scrollToItem(at: indexToScrollTo, at: .left, animated: false)
            onceOnly = true
        }
    }
    @objc func SaveSC(){
        let ac = UIAlertController(title: "Saved!", message: "The livephoto has been saved to your photos.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(SaveSC), name: .SaveSCMy, object: nil)
        view.addSubview(btnDownload)
        btnDownload.frame = CGRect(x: (view.frame.size.width/2)-50.5, y: view.frame.size.height-HIPH(h: 93)
            , width: 101, height: 48)
        // Do any additional setup after loading the view.
    }

    override func viewWillDisappear(_ animated: Bool) {
        
    }
    override func viewWillAppear(_ animated: Bool) {
        GoogleAdMob.sharedInstance.view = self
        RE.sharedInstanceRE.view = self
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
