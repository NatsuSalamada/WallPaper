//
//  SettingViewController.swift
//  WallPaper
//
//  Created by Bé Nhện Của Bé Thảo on 20/08/2018.
//  Copyright © 2018 NatsuSalamada. All rights reserved.
//

import UIKit
import MessageUI
import StoreKit

class SettingViewController: UIViewController, MFMailComposeViewControllerDelegate {

    
    @IBOutlet weak var btnRateApp: UIButton!
    
    @IBOutlet weak var btnFeedBack: UIButton!
    
    @IBOutlet weak var btnRestorePurchase: UIButton!
    
    @IBOutlet weak var btnPoli: UIButton!
    
    func clearAllFile() {
        let fileManager = FileManager.default
        
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        print("Directory: \(paths)")
        
        do
        {
            let fileName = try fileManager.contentsOfDirectory(atPath: paths)
            
            for file in fileName {
                
                // For each file in the directory, create full path and delete the file
                let filePath = URL(fileURLWithPath: paths).appendingPathComponent(file).absoluteURL
                try fileManager.removeItem(at: filePath)
                TakePhotoCoreData.share.deleteAllData()
                LivePhoToCoreData.share.deleteAllData()
                LivePhoToMyCoreData.share.deleteAllData()
                livePhotoTemp.removeAll()
                livePhotoMyTemp.removeAll()
                let ac = UIAlertController(title: "Cleared!", message: "The Cache is Cleared!!!", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "OK", style: .default))
                present(ac, animated: true)
            }
        }catch let error {
            print(error.localizedDescription)
        }
    }
    
    @IBAction func abtnRateApp(_ sender: UIButton) {
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(urlAppGuide, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(urlAppGuide)
        }
        UserDefaults.standard.set(4, forKey: "Ran")
        UserDefaults.standard.set(10, forKey: "Show")
    }
    @IBAction func abtnFeedBack(_ sender: UIButton) {
        if MFMailComposeViewController.canSendMail(){
            let composeVC = MFMailComposeViewController()
            composeVC.mailComposeDelegate = self
            
            // Configure the fields of the interface.
            composeVC.setToRecipients([mail])
            composeVC.setSubject("Wallpaper Feedback")
            composeVC.setMessageBody("Hey Bro! Here's my feedback.", isHTML: false)
            
            // Present the view controller modally.
            self.present(composeVC, animated: true, completion: nil)
        }else{
            let alert = UIAlertController(title: "Warring", message: "Mail services are not available", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func abtnPoli(_ sender: UIButton) {
        if #available(iOS 10.0, *) {
            
            UIApplication.shared.open(URL(string: linkPoli)!, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(URL(string: linkPoli)!)
        }
    }
    
    @IBAction func abtnRestorePurchase(_ sender: UIButton) {
        self.clearAllFile()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
        self.view.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 1.0)
        // Do any additional setup after loading the view.
    }

    func setUpUI(){
        btnRateApp.set(image: #imageLiteral(resourceName: "iconRateOn"), title: "Rate our app", titlePosition: .T, additionalSpacing: 50, state: .normal)
        btnFeedBack.set(image: #imageLiteral(resourceName: "iconFeedback"), title: "Feedback", titlePosition: .right, additionalSpacing: 50, state: .normal)
        btnRestorePurchase.set(image: #imageLiteral(resourceName: "btnClear"), title: "Clear cache", titlePosition: .right, additionalSpacing: 50, state: .normal)
        btnPoli.set(image: #imageLiteral(resourceName: "privacy"), title: "Privacy Policy", titlePosition: .right, additionalSpacing: 50, state: .normal)
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
    }r
    */

}
extension SettingViewController{
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}
