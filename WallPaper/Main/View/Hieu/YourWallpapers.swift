//
//  YourWallpapers.swift
//  WallPaper
//
//  Created by 5k on 6/4/18.
//  Copyright © 2018 NatsuSalamada. All rights reserved.
//

import UIKit

class YourWallpapers: UIViewController{
    
    @IBOutlet weak var FadedView: UIView!
    @IBOutlet weak var View_My: UIView!
    
    @IBOutlet weak var btn_CreateWall: UIButton!
//    @IBOutlet weak var CreateView: UIView!
    @IBOutlet weak var btn_CreateLive: UIButton!
    var btn_expand_state = 0
    lazy var WallpapersControlller:UIViewController? = {
        
        let wallpapersController = self.storyboard?.instantiateViewController(withIdentifier: "Wallpapers_My")
        return wallpapersController
        
    }()
    
    lazy var LiveWallpapersController:UIViewController? = {
        let livewallpapersController = self.storyboard?.instantiateViewController(withIdentifier: "LiveWallpapers_My")
        return livewallpapersController
    }()
    
    var currentViewCOntroller:UIViewController?
    
    
    @IBOutlet weak var btn_expand: UIButton!
    @IBAction func abtn_Expand(_ sender: Any) {
        
        if btn_expand_state == 0{
            
         
            
            btn_expand.transform = CGAffineTransform.identity
            UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseInOut, animations: { () -> Void in
            let rotation = CGAffineTransform.init(rotationAngle: CGFloat(Double.pi/4))
            self.btn_expand.transform = rotation
    
            }, completion: nil)
            btn_expand_state = 1
            
            UIView.animate(withDuration: 0.5) {
                
                self.btn_CreateLive.alpha = 1
                self.btn_CreateWall.alpha = 1
                self.FadedView.alpha = 1
            }
            
            
            let animation = CAKeyframeAnimation(keyPath: "transform.translation.y")
            animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
            animation.duration = 0.5
            animation.values = [32, 0 ]
            btn_CreateWall.layer.add(animation, forKey: "move")
            
            let animation1 = CAKeyframeAnimation(keyPath: "transform.translation.y")
            animation1.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
            animation1.duration = 0.5
            animation1.values = [32, 0 ]
            btn_CreateLive.layer.add(animation, forKey: "move")
        }else{
            
            UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseInOut, animations: { () -> Void in
                self.btn_expand.transform = CGAffineTransform.identity
   
                
            }, completion: nil)
            UIView.animate(withDuration: 0.5) {
                self.btn_expand_state = 0
                self.btn_CreateLive.alpha  = 0
                self.btn_CreateWall.alpha  = 0
                self.FadedView.alpha = 0
            }

            let animation = CAKeyframeAnimation(keyPath: "transform.translation.y")
            animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
            animation.duration = 0.5
            animation.values = [0, 32 ]
            btn_CreateWall.layer.add(animation, forKey: "move")
            
            let animation1 = CAKeyframeAnimation(keyPath: "transform.translation.y")
            animation1.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
            animation1.duration = 0.5
            animation1.values = [0, 32 ]
            btn_CreateLive.layer.add(animation, forKey: "move")
            
        }
    }
    
<<<<<<< Updated upstream
=======
  
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
>>>>>>> Stashed changes
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(ChangeDisplay), name: Notification.Name("ChangeDislay") , object: nil)
        ChangeDisplayViewLoad(index: 0)
        btn_CreateLive.set(image: #imageLiteral(resourceName: "iconCreateLiveWallpapers") , title: "Create Live Wallpapers     ", titlePosition: .left, additionalSpacing: 8, state: .normal)
        btn_CreateWall.set(image: #imageLiteral(resourceName: "iconCreateWallpapers"), title: "Create Wallpapers     ", titlePosition: .left, additionalSpacing: 8, state: .normal)
        btn_CreateLive.alpha = 0
        btn_CreateWall.alpha  = 0
        FadedView.alpha  = 0
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
        vc.view.frame = self.View_My.bounds
        View_My.addSubview(vc.view)
        currentViewCOntroller = vc
    }
    
    @objc func ChangeDisplay(noti:Notification){
        print("Change:\(noti.object as! Int)")
        currentViewCOntroller?.view.removeFromSuperview()
        currentViewCOntroller?.removeFromParentViewController()
        let vc = CheckCollection(index: noti.object as! Int)
        vc.didMove(toParentViewController: self)
        self.addChildViewController(vc)
        vc.view.frame = self.View_My.bounds
        View_My.addSubview(vc.view)
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
