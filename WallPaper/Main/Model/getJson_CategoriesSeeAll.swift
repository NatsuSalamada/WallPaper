    //
//  getJson_CategoriesSeeAll.swift
//  WallPaper
//
//  Created by User on 7/5/18.
//  Copyright © 2018 NatsuSalamada. All rights reserved.
//

import Foundation

class getJson_CategoriesSeeAll: NSObject {
    static let sharedInstance = getJson_CategoriesSeeAll()
    var imageCurrent = [[String : AnyObject]]()
    let notification = NotificationCenter()
    @objc func fetchFeedForUrlString(){
        json_categories_SeeAll.removeAll()
        URLSession.shared.dataTask(with: link_Categories_SeeAll!, completionHandler: { (data, response, error) in
            if error != nil {
                print(error!)
                
                return
            }
            do {
                
                if let unwrappedData = data, let imageResult = try JSONSerialization.jsonObject(with: unwrappedData, options: .mutableContainers) as? NSDictionary {
                    
                    DispatchQueue.main.async(execute: {
                        self.imageCurrent = (imageResult[dictionary_cate] as? [[String : AnyObject]])!
                        print(dictionary_cate)
                        
                        for image in self.imageCurrent{
                          
                            json_categories_SeeAll.append(image["link"] as! String)
                            json_idCategories_SeeAll.append(image["id"] as! String)
                           
                        }
                       NotificationCenter.default.post(name: .CategoriesDownload, object: nil)
                        
                    })
                    
                }
                
            } catch let jsonError {
                print(jsonError)
            }
        }) .resume()
    }
}
