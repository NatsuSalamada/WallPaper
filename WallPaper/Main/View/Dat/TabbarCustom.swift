//
//  TabbarCustom.swift
//  WallPaper
//
//  Created by Bé Nhện Của Bé Thảo on 14/08/2018.
//  Copyright © 2018 NatsuSalamada. All rights reserved.
//

import UIKit
import DKChainableAnimationKit

class TabbarCustom: UITabBarController,UITabBarControllerDelegate {

    
    lazy var Home:UIViewController? = {
        
        let homeController = self.storyboard?.instantiateViewController(withIdentifier: "Home")
        return homeController
        
    }()
    
    lazy var CategogiesView:UINavigationController? = {
        let categogiesViewController = self.storyboard?.instantiateViewController(withIdentifier: "CategogiesView") as? UINavigationController
        return categogiesViewController
    }()
    
    lazy var YourWallpapers:UINavigationController? = {
        let yourWallpapersController = self.storyboard?.instantiateViewController(withIdentifier: "YourWallpapers") as? UINavigationController
        return yourWallpapersController
    }()
    
    lazy var Setting:UIViewController? = {
        let settingController = self.storyboard?.instantiateViewController(withIdentifier: "SettingViewController")
        return settingController
    }()
    
    
    

}
