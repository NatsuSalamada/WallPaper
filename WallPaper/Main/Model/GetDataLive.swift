//
//  GetDataLive.swift
//  WallPaper
//
//  Created by Bé Nhện Của Bé Thảo on 24/08/2018.
//  Copyright © 2018 NatsuSalamada. All rights reserved.
//

import Foundation
class GetDataLive: NSObject {
    static let sharedInstance = GetDataLive()
    var imageCurrent = [[String : AnyObject]]()
    let notification = NotificationCenter()
    func get(){
        PhotoLiveCategories.removeAll()
        if dictionary_cate == "N"{
            PhotoLiveCategories = NewArrival_Live_List
        }else if dictionary_cate == "P"{
            PhotoLiveCategories = Popular_Live_List
        }else{
            guard let catePT = liveCateSeeAll else{
                return
            }
            
            self.imageCurrent = (catePT[live_dictionary_cate] as? [[String : AnyObject]])!
            for image in self.imageCurrent{
                let user = UserInfo(id: image["id"] as! String, link: image["link"] as! String)
                
                PhotoLiveCategories.append(user)
                
                
            }
        }
        
        //NotificationCenter.default.post(name: .LiveCate, object: nil)
    }
    
}

//import Foundation
//
//class getJson_LiveCategories: NSObject {
//    static let sharedInstance = getJson_LiveCategories()
//    var imageCurrent = [[String : AnyObject]]()
//    let notification = NotificationCenter()
//    @objc func fetchFeedForUrlString(){
//        PhotoLiveCategories.removeAll()
//
//
//        URLSession.shared.dataTask(with: link_Live_Categories!, completionHandler: { (data, response, error) in
//            if error != nil {
//                print(error!)
//
//                return
//            }
//            do {
//
//                if let unwrappedData = data, let imageResult = try JSONSerialization.jsonObject(with: unwrappedData, options: .mutableContainers) as? NSDictionary {
//
//                    DispatchQueue.main.async(execute: {
//                        self.imageCurrent = (imageResult[live_dictionary_cate] as? [[String : AnyObject]])!
//                        print(live_dictionary_cate)
//
//                        for image in self.imageCurrent{
//                            let user = UserInfo(id: image["id"] as! String, link: image["link"] as! String)
//
//                            PhotoLiveCategories.append(user)
//
//
//                        }
//                        NotificationCenter.default.post(name: .LiveCate, object: nil)
//
//                    })
//
//                }
//
//            } catch let jsonError {
//                print(jsonError)
//            }
//        }) .resume()
//    }
//}
