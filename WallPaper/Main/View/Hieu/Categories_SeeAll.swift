//
//  Categories_SeeAll.swift
//  WallPaper
//
//  Created by 5k on 6/8/18.
//  Copyright © 2018 NatsuSalamada. All rights reserved.
//

import UIKit

class Categories_SeeAll: UIViewController {

    @IBAction func abtn_SA(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBOutlet weak var View_SeeAll: UIView!
    lazy var WallpapersControlller:UIViewController? = {
        
        let wallpapersController = self.storyboard?.instantiateViewController(withIdentifier: "Wallpapers_SeeAll")
        return wallpapersController
        
    }()
    
    lazy var LiveWallpapersController:UIViewController? = {
        let livewallpapersController = self.storyboard?.instantiateViewController(withIdentifier: "LiveWallpapers_SeeAll")
        return livewallpapersController
    }()
    
    var currentViewCOntroller:UIViewController?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(ChangeDisplay), name: Notification.Name("ChangeDislay") , object: nil)
        
        ChangeDisplayViewLoad(index: 0)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if let current = currentViewCOntroller{
            current.viewWillDisappear(true)
        }
    }
    
    func ChangeDisplayViewLoad(index:Int){
        
        let vc = CheckCollection(index: index)
        vc.didMove(toParentViewController: self)
        self.addChildViewController(vc)
        vc.view.frame = self.View_SeeAll.bounds
        View_SeeAll.addSubview(vc.view)
        currentViewCOntroller = vc
    }
    
    @objc func ChangeDisplay(noti:Notification){
        print("Change:\(noti.object as! Int)")
        currentViewCOntroller?.view.removeFromSuperview()
        currentViewCOntroller?.removeFromParentViewController()
        let vc = CheckCollection(index: noti.object as! Int)
        vc.didMove(toParentViewController: self)
        self.addChildViewController(vc)
        vc.view.frame = self.View_SeeAll.bounds
        View_SeeAll.addSubview(vc.view)
    }
    
    func CheckCollection(index:Int) ->UIViewController {
        if(index == 0){
            return WallpapersControlller!
        }else{
            return LiveWallpapersController!
        }
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
