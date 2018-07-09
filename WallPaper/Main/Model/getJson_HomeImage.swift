//
//  getJson_HomeImage.swift
//  WallPaper
//
//  Created by User on 7/4/18.
//  Copyright © 2018 NatsuSalamada. All rights reserved.
//
//
//  getJsonImage.swift
//  ServerTest
//
//  Created by User on 6/29/18.
//  Copyright © 2018 User. All rights reserved.
import Foundation

class getJson_HomeImage: NSObject {
    static let sharedInstance = getJson_HomeImage()
    var imageCurrent = [[String : AnyObject]]()
    let notification = NotificationCenter()
    @objc func fetchFeedForUrlString(){
        URLSession.shared.dataTask(with: link_Home!, completionHandler: { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            do {
                
                if let unwrappedData = data, let imageResult = try JSONSerialization.jsonObject(with: unwrappedData, options: .mutableContainers) as? NSDictionary {
                    
                    DispatchQueue.main.async(execute: {
                        self.imageCurrent = (imageResult["ImagesHome"] as? [[String : AnyObject]])!
                        for image in self.imageCurrent{
                            json_imageHome.append(image["link"] as! String)
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

