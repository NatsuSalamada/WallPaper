//
//  getJson_CategoriesIcon.swift
//  WallPaper
//
//  Created by User on 7/5/18.
//  Copyright © 2018 NatsuSalamada. All rights reserved.
//

import Foundation

class getJson_CategoriesIcon: NSObject {
    static let sharedInstance = getJson_CategoriesIcon()
    var imageCurrent = [[String : AnyObject]]()
    let notification = NotificationCenter()
    @objc func fetchFeedForUrlString(){
        URLSession.shared.dataTask(with: link_Categories_icon!, completionHandler: { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            do {
                
                if let unwrappedData = data, let imageResult = try JSONSerialization.jsonObject(with: unwrappedData, options: .mutableContainers) as? NSDictionary {
                    
                    DispatchQueue.main.async(execute: {
                        self.imageCurrent = (imageResult["IconCategories"] as? [[String : AnyObject]])!
                        for image in self.imageCurrent{
                            json_categoriesicon.append(image["link"] as! String)
                        }
                        NotificationCenter.default.post(name: .ImageHomeDownload, object: nil)
                        
                    })
                    
                }
                
            } catch let jsonError {
                print(jsonError)
            }
        }) .resume()
    }
}
