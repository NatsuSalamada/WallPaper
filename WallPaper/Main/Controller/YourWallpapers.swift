//
//  YourWallpapers.swift
//  WallPaper
//
//  Created by 5k on 6/4/18.
//  Copyright © 2018 NatsuSalamada. All rights reserved.
//

import UIKit
import Photos
import PhotosUI
import MobileCoreServices

var array_Image_library = [UIImage]()
class YourWallpapers: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet weak var FadedView: UIView!
    @IBOutlet weak var View_My: UIView!
    @IBOutlet weak var btn_CreateWall: UIButton!
//    @IBOutlet weak var CreateView: UIView!
    @IBOutlet weak var btn_CreateLive: UIButton!
    var imagePicker: UIImagePickerController!
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
    

  
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(ChangeDisplay), name: Notification.Name("ChangeDislay") , object: nil)
        ChangeDisplayViewLoad(index: 0)
        btn_CreateLive.set(image: #imageLiteral(resourceName: "iconCreateLiveWallpapers") , title: "Create Live Wallpapers     ", titlePosition: .left, additionalSpacing: 8, state: .normal)
        btn_CreateWall.set(image: #imageLiteral(resourceName: "iconCreateWallpapers"), title: "Create Wallpapers     ", titlePosition: .left, additionalSpacing: 8, state: .normal)
        btn_CreateLive.alpha = 0
        btn_CreateWall.alpha  = 0
        FadedView.alpha  = 0
//        let tapGesture = UITapGestureRecognizer(target: self.FadedView, action: #selector(TapFadedView(_:)))
//        view.addGestureRecognizer(tapGesture)
        
        FadedView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(TapFadedView(_:))))
    }
    
    @objc  func TapFadedView(_ sender: UITapGestureRecognizer){

        UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseInOut, animations: { () -> Void in
            self.btn_expand.transform = CGAffineTransform.identity
        }, completion: nil)
        UIView.animate(withDuration: 0.5) {
            self.btn_expand_state = 0
            self.btn_CreateLive.alpha  = 0
            self.btn_CreateWall.alpha  = 0
            self.FadedView.alpha = 0
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
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            let ac = UIAlertController(title: "Save error", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: "Saved!", message: "Your altered image has been saved to your photos.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }
    
    @IBAction func abtn_CreateLive(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .camera
        picker.mediaTypes = [kUTTypeMovie as String]
        present(picker, animated: true, completion: nil)
    }
    @IBAction func abtn_TakePhotoWallpaper(_ sender: Any) {
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let PickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage{
           
            array_Image_library.append(PickedImage)
           NotificationCenter.default.post(name: .LibaryWallpaper, object: nil)
        }
        imagePicker.dismiss(animated: true, completion: nil)
       
    }
}
