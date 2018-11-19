//
//  GoogleAdsMob.swift
//  Cleaner
//
//  Created by ChungTran on 10/18/17.
//  Copyright © 2017 BaBaBiBo. All rights reserved.
//

import UIKit
import GoogleMobileAds


//MARK: - Create GoogleAdMob Class
class GoogleAdMob: NSObject {
    
    //MARK: - Google Ads Unit ID
    struct GoogleAdsUnitID {
        static var strInterstitialAdsID = Interstitial_ID
    }
    
    static let sharedInstance : GoogleAdMob = GoogleAdMob()
    private var isInitializeInterstitial = false
    private var interstitialAds: GADInterstitial!
    var view:UIViewController?
    private var Sho = false
    private enum typeADs:Int{
        case notThing = 0
        case Basic = 1
        case ad120 = 2
    }
    private var typeAd:Int = 0
    override init() {
        super.init()
        let save = UserDefaults.standard
        if (save.value(forKey: "Purchase") == nil){
            self.createInterstitial()
        }
        
    }
    
    private func createInterstitial() {
        
        interstitialAds = GADInterstitial(adUnitID: GoogleAdsUnitID.strInterstitialAdsID)
        interstitialAds.delegate = self
        interstitialAds.load(GADRequest())
    }
    
    func showInterstitial() {
//        guard AppDelegate.share.reachability.connection != .none else {return}
        let save = UserDefaults.standard
        if (save.value(forKey: "Purchase") == nil){
            self.typeAd = typeADs.Basic.rawValue
            if interstitialAds.isReady {
                
                interstitialAds.present(fromRootViewController: (UIApplication.shared.keyWindow?.rootViewController)!)
            } else {
                createInterstitial()
            }
        }
        
    }
    func show120(){
        if timeAdShow >= timeLitmit{
            if self.typeAd == typeADs.Basic.rawValue{
                self.Sho = true
            }else{
//                guard AppDelegate.share.reachability.connection != .none else {return}
                if (UserDefaults.standard.value(forKey: "Purchase") == nil){
                    timeAdShow = 0
                    self.typeAd = typeADs.ad120.rawValue
                    if interstitialAds.isReady {
                        if let v = view{
                            interstitialAds.present(fromRootViewController: v)
                        }else{
                            interstitialAds.present(fromRootViewController: (UIApplication.shared.keyWindow?.rootViewController)!)
                        }
                        
                    } else {
                        createInterstitial()
                    }
                }else{
                    return
                }
            }
        }else{
            if (UserDefaults.standard.value(forKey: "Purchase") == nil){
                Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
                    timeAdShow = timeAdShow + 1
                    self.show120()
                }
            }else{
                return
            }
        }
        
    }
   
}

// MARK: - GADInterstitialDelegate

extension GoogleAdMob: GADInterstitialDelegate {
    
    func interstitialDidReceiveAd(_ ad: GADInterstitial) {
        if self.typeAd == typeADs.Basic.rawValue{
            self.showInterstitial()
            if self.Sho{
                self.show120()
                self.Sho = false
            }
        }else if self.typeAd == typeADs.ad120.rawValue{
            self.show120()
        }
        
    }
    
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        if self.typeAd == typeADs.Basic.rawValue{
            if check120{
                GoogleAdMob.sharedInstance.show120()
                check120 = false
            }
        }else if self.typeAd == typeADs.ad120.rawValue{
            self.show120()
        }
        self.typeAd = typeADs.notThing.rawValue
//        (((UIApplication.shared.keyWindow?.rootViewController) as? Home)?.currentViewCOntroller as? Wallpapers_Home)?.CollView_WallHome.reloadData()
    }
    func interstitialWillDismissScreen(_ ad: GADInterstitial) {
        
    }
    func interstitialWillPresentScreen(_ ad: GADInterstitial) {
        
    }
    func interstitialWillLeaveApplication(_ ad: GADInterstitial) {
        
    }
    func interstitialDidFail(toPresentScreen ad: GADInterstitial) {
        
    }
    func interstitial(_ ad: GADInterstitial, didFailToReceiveAdWithError error: GADRequestError) {
        print("\(error.description)")
        
    }
}

class RE:NSObject, GADRewardBasedVideoAdDelegate{
    
    static let sharedInstanceRE = RE()
    private var complete = 0
    var view:UIViewController?
    func requestLoadAd(){
        GADRewardBasedVideoAd.sharedInstance().delegate = self
        let request = GADRequest()
        // Requests test ads on test devices.
        
        GADRewardBasedVideoAd.sharedInstance().load(request, withAdUnitID: RewardVideo_ID)
    }
    func C()->Bool{
        if GADRewardBasedVideoAd.sharedInstance().isReady {
            return true
        }
        return false
    }
    func S(){
        if GADRewardBasedVideoAd.sharedInstance().isReady {
            if let v = view{
                GADRewardBasedVideoAd.sharedInstance().present(fromRootViewController: v)
            }else{
                GADRewardBasedVideoAd.sharedInstance().present(fromRootViewController: (UIApplication.shared.keyWindow?.rootViewController)!)
            }
            
        }
    }
    func rewardBasedVideoAdDidOpen(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("rewardBasedVideoAdDidOpen")
        
    }
    
    func rewardBasedVideoAdDidClose(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("rewardBasedVideoAdDidClose")
        
        
        GADRewardBasedVideoAd.sharedInstance().load(GADRequest(), withAdUnitID: RewardVideo_ID)
        if complete == 1{
            if DD == 0{
                NotificationCenter.default.post(name: .SWHome, object: nil)
            }else if DD == 1{
                NotificationCenter.default.post(name: .SWClick, object: nil)
            }else if DD == 2{
                NotificationCenter.default.post(name: .SLHome, object: nil)
            }else if DD == 3{
                NotificationCenter.default.post(name: .SLClick, object: nil)
            }
        }else{
            UserDefaults.standard.set(1, forKey: "Show")
        }
        
    }
    
    func rewardBasedVideoAdDidReceive(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("rewardBasedVideoAdDidReceive")
    }
    
    func rewardBasedVideoAdDidStartPlaying(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("rewardBasedVideoAdDidStartPlaying")
        self.complete = 0
    }
    
    func rewardBasedVideoAdWillLeaveApplication(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("rewardBasedVideoAdWillLeaveApplication")
    }
    
    func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd, didRewardUserWith reward: GADAdReward) {
        print("Should reward user with \(reward.amount) \(reward.type)")
        
            self.complete = 1
        
    }
    
    func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd, didFailToLoadWithError error: Error) {
        print("didFailToLoadWithError")
        GADRewardBasedVideoAd.sharedInstance().load(GADRequest(), withAdUnitID: RewardVideo_ID)
    }
    func rewardBasedVideoAdDidCompletePlaying(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        
    }
    
}
