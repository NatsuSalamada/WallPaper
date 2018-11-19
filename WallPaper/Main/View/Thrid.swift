//
//  Thrid.swift
//  WallPaper
//
//  Created by Bé Nhện Của Bé Thảo on 05/09/2018.
//  Copyright © 2018 NatsuSalamada. All rights reserved.
//

import UIKit

class Thrid: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func abtnEnable(_ sender: UIButton) {
        let notificationSettings = UIUserNotificationSettings(types: [.badge, .sound, .alert], categories: nil)
        UIApplication.shared.registerUserNotificationSettings(notificationSettings)
    }
    @IBAction func abtnLater(_ sender: UIButton) {
        
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
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
