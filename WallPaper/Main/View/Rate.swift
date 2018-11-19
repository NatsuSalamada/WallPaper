//
//  Rate.swift
//  WallPaper
//
//  Created by Bé Nhện Của Bé Thảo on 05/09/2018.
//  Copyright © 2018 NatsuSalamada. All rights reserved.
//

import UIKit

class Rate: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func Rate(_ sender: UIButton) {
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(urlAppGuide, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(urlAppGuide)
        }
        dismiss(animated: true, completion: nil)
        if DD == 0{
            NotificationCenter.default.post(name: .SWHome, object: nil)
        }else if DD == 1{
            NotificationCenter.default.post(name: .SWClick, object: nil)
        }else if DD == 2{
            NotificationCenter.default.post(name: .SLHome, object: nil)
        }else if DD == 3{
            NotificationCenter.default.post(name: .SLClick, object: nil)
        }
        UserDefaults.standard.set(4, forKey: "Ran")
        UserDefaults.standard.set(10, forKey: "Show")
    }
    
    @IBAction func Later(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
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
