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

    var isTestMode = false
    
    override init() {
        super.init()
        let save = UserDefaults.standard
        if (save.value(forKey: "Purchase") == nil){
            self.createInterstitial()
        }
        
    }
    
    private func createInterstitial() {
        guard !isTestMode else {return}
        interstitialAds = GADInterstitial(adUnitID: GoogleAdsUnitID.strInterstitialAdsID)
        interstitialAds.delegate = self
        interstitialAds.load(GADRequest())
    }
    
    func showInterstitial() {
        guard !isTestMode else {return}
        guard AppDelegate.share.reachability.connection != .none else {return}
        let save = UserDefaults.standard
        if (save.value(forKey: "Purchase") == nil){
            if interstitialAds.isReady {
                
                interstitialAds.present(fromRootViewController: (UIApplication.shared.keyWindow?.rootViewController)!)
            } else {
                createInterstitial()
            }
        }
        
    }
   
}

// MARK: - GADInterstitialDelegate

extension GoogleAdMob: GADInterstitialDelegate {
    
    func interstitialDidReceiveAd(_ ad: GADInterstitial) {
        showInterstitial()
    }
    
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        
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
    func S(_ viewController: UIViewController){
        if GADRewardBasedVideoAd.sharedInstance().isReady {
            GADRewardBasedVideoAd.sharedInstance().present(fromRootViewController: viewController)
        }
    }
    func rewardBasedVideoAdDidOpen(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("rewardBasedVideoAdDidOpen")
        
    }
    
    func rewardBasedVideoAdDidClose(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("rewardBasedVideoAdDidClose")
        
        
        GADRewardBasedVideoAd.sharedInstance().load(GADRequest(), withAdUnitID: RewardVideo_ID)
        
        
    }
    
    func rewardBasedVideoAdDidReceive(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("rewardBasedVideoAdDidReceive")
    }
    
    func rewardBasedVideoAdDidStartPlaying(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("rewardBasedVideoAdDidStartPlaying")
    }
    
    func rewardBasedVideoAdWillLeaveApplication(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("rewardBasedVideoAdWillLeaveApplication")
    }
    
    func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd, didRewardUserWith reward: GADAdReward) {
        print("Should reward user with \(reward.amount) \(reward.type)")
    }
    
    func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd, didFailToLoadWithError error: Error) {
        print("didFailToLoadWithError")
        GADRewardBasedVideoAd.sharedInstance().load(GADRequest(), withAdUnitID: RewardVideo_ID)
    }
    
}
