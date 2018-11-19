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
        self.view.setGradients(color_01: UIColor(displayP3Red: 51/255, green: 50/255, blue: 55/255, alpha: 1.0), color_02: UIColor(displayP3Red: 11/255, green: 1/255, blue: 1/255, alpha: 1.0))
        ChangeDisplayViewLoad(index: 0)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let currentViewCOntroller = currentViewCOntroller {
            currentViewCOntroller.viewWillDisappear(animated)
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
        ChangeDisplayViewLoad(index: noti.object as! Int)
    }
    
    func CheckCollection(index:Int) ->UIViewController {
        if(index == 0){
            
          return WallpapersControlller!
        }else {
            
            return LiveWallpapersController!
        }
    }
    override func viewDidDisappear(_ animated: Bool) {
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
