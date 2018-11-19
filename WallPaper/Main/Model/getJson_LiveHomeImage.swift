//
//  getJson_LiveHomeImage.swift
//  WallPaper
//
//  Created by User on 7/10/18.
//  Copyright © 2018 NatsuSalamada. All rights reserved.
//

import UIKit
import Foundation

class getJson_LiveHomeImage: NSObject {
    static let sharedInstance = getJson_LiveHomeImage()
    var imageCurrent = [[String : AnyObject]]()
<<<<<<< HEAD
   
=======
    let notification = NotificationCenter()
>>>>>>> 448d4ba881ec20425d0a2a44225b3512f98b7080
    @objc func fetchFeedForUrlString(){
        URLSession.shared.dataTask(with: link_LiveHome!, completionHandler: { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            do {
                
                if let unwrappedData = data, let imageResult = try JSONSerialization.jsonObject(with: unwrappedData, options: .allowFragments) as? NSDictionary {
                    
                    DispatchQueue.main.async(execute: {
                        self.imageCurrent = (imageResult["LiveHome"] as? [[String : AnyObject]])!
                        for image in self.imageCurrent{
<<<<<<< HEAD
                            let user = UserInfo(id: image["id"] as! String, link: image["link"] as! String)
                            LivePhotoList.append(user)
                        }
                      
=======
                            json_LiveImageHome.append(image["link"] as! String)
                        }
                       NotificationCenter.default.post(name: .LiveDownload, object: nil)
>>>>>>> 448d4ba881ec20425d0a2a44225b3512f98b7080
                        
                    })
                    
                }
                
            } catch let jsonError {
                print(jsonError)
            }
        }) .resume()
    }
}
