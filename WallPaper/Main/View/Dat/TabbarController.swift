//
//  TabbarController.swift
//  Fake
//
//  Created by Bé Nhện Của Bé Thảo on 16/04/2018.
//  Copyright © 2018 NatsuSalamada. All rights reserved.
//

import UIKit

class TabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.config()
       
        // Do any additional setup after loading the view.
    }
    private func config(){
        
        tabBar.tintColor = UIColor.white   // Thay doi mau content ben trong
        //tabBar.barTintColor = UIColor.red
        tabBar.layer.borderWidth = 0
        tabBar.isTranslucent = false
        tabBar.backgroundImage = UIImage(named: "background")
       
  
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.tag == 1{
            let bounceAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
            bounceAnimation.values = [1.0 ,1.4, 0.9, 1.15, 0.95, 1.02, 1.0]
            bounceAnimation.duration = 1.2
            bounceAnimation.calculationMode = kCAAnimationCubic
            (tabBar.subviews[1].subviews[0] as! UIImageView).layer.add(bounceAnimation, forKey: "bounceAnimation")
        }
            else  if item.tag == 2{
            
            (tabBar.subviews[2].subviews[0] as! UIImageView).transform = CGAffineTransform.identity
            UIView.animate(withDuration: 0.7, delay: 0.2, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseInOut, animations: { () -> Void in
            let rotation = CGAffineTransform.init(rotationAngle: CGFloat(Double.pi))
                (tabBar.subviews[2].subviews[0] as! UIImageView).transform = rotation
            }, completion: nil)
            
        }else{
            let bounceAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
            bounceAnimation.values = [1.0 ,1.4, 0.9, 1.15, 0.95, 1.02, 1.0]
            bounceAnimation.duration = 1.2
            bounceAnimation.calculationMode = kCAAnimationCubic
            (tabBar.subviews[3].subviews[0] as! UIImageView).layer.add(bounceAnimation, forKey: "bounceAnimation")
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
