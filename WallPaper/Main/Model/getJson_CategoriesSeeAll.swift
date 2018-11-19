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
    
    @objc func fetchFeedForUrlString(){
        PhotoCategoriesSeeAll.removeAll()
        URLSession.shared.dataTask(with: link_Categories_SeeAll!, completionHandler: { (data, response, error) in
            if error != nil {
                print(error!)
                
                return
            }
            do {
                
                if let unwrappedData = data, let imageResult = try JSONSerialization.jsonObject(with: unwrappedData, options: .mutableContainers) as? NSDictionary {
                    
                    DispatchQueue.main.async(execute: {
<<<<<<< HEAD
                        
                        photoCateSeeAll = imageResult
=======
                        self.imageCurrent = (imageResult[dictionary_cate] as? [[String : AnyObject]])!
                        print(dictionary_cate)
                        
                        for image in self.imageCurrent{
                          
                            json_categories_SeeAll.append(image["link"] as! String)
                            json_idCategories_SeeAll.append(image["id"] as! String)
                           
                        }
                       NotificationCenter.default.post(name: .CategoriesDownload, object: nil)
>>>>>>> 448d4ba881ec20425d0a2a44225b3512f98b7080
                        
                    })
                    
                }
                
            } catch let jsonError {
                print(jsonError)
            }
        }) .resume()
    }
}
