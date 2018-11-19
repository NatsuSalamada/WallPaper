
import Foundation
//
//  getJson_LiveCategories.swift
//  WallPaper
//
//  Created by User on 8/8/18.
//  Copyright © 2018 NatsuSalamada. All rights reserved.
//

import Foundation

class getJson_Popular_Horizal: NSObject {
    static let sharedInstance = getJson_Popular_Horizal()
    var imageCurrent = [[String : AnyObject]]()
    
    @objc func fetchFeedForUrlString(){
        //        PhotoLiveCategories.removeAll()
        URLSession.shared.dataTask(with: link_Cate_Popular!, completionHandler: { (data, response, error) in
            if error != nil {
                print(error!)
                
                return
            }
            do {
                
                if let unwrappedData = data, let imageResult = try JSONSerialization.jsonObject(with: unwrappedData, options: .mutableContainers) as? NSDictionary {
                    
                    DispatchQueue.main.async(execute: {
                        self.imageCurrent = (imageResult["Popular-Horizal"] as? [[String : AnyObject]])!
                        
                        
                        for image in self.imageCurrent{
                            let user = UserInfo(id: image["id"] as! String, link: image["link"] as! String)
                            
                            Popular_Horizal_List.append(user)
                            
                            
                        }
                        
                        
                    })
                    
                }
                
            } catch let jsonError {
                print(jsonError)
            }
        }) .resume()
    }
}
