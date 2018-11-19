//
//  Reward.swift
//  WallPaper
//
//  Created by Bé Nhện Của Bé Thảo on 05/09/2018.
//  Copyright © 2018 NatsuSalamada. All rights reserved.
//

import UIKit

class Reward: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func abtnPlay(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
        RE.sharedInstanceRE.S()
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
