//
//  getJson_LiveCategories.swift
//  WallPaper
//
//  Created by User on 8/8/18.
//  Copyright © 2018 NatsuSalamada. All rights reserved.
//

import Foundation
//
//  getJson_CategoriesSeeAll.swift
//  WallPaper
//
//  Created by User on 7/5/18.
//  Copyright © 2018 NatsuSalamada. All rights reserved.
//

import Foundation

class getJson_NewArrival_SeeAll: NSObject {
    static let sharedInstance = getJson_NewArrival_SeeAll()
    var imageCurrent = [[String : AnyObject]]()
    
    @objc func fetchFeedForUrlString(){
//        PhotoLiveCategories.removeAll()
        URLSession.shared.dataTask(with: link_Cate_NewArrivals!, completionHandler: { (data, response, error) in
            if error != nil {
                print(error!)
                
                return
            }
            do {
                
                if let unwrappedData = data, let imageResult = try JSONSerialization.jsonObject(with: unwrappedData, options: .mutableContainers) as? NSDictionary {
                    
                    DispatchQueue.main.async(execute: {
                        self.imageCurrent = (imageResult["NewArrival-SeeAll"] as? [[String : AnyObject]])!
                        
                        
                        for image in self.imageCurrent{
                            let user = UserInfo(id: image["id"] as! String, link: image["link"] as! String)
                            
                            NewArrival_SeeAll_List.append(user)
                            
                            
                        }
                       
                        
                    })
                    
                }
                
            } catch let jsonError {
                print(jsonError)
            }
        }) .resume()
    }
}
