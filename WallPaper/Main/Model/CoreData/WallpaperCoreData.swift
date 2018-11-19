//
//  WallpaperCoreData.swift
//  WallPaper
//
//  Created by User on 7/11/18.
//  Copyright © 2018 NatsuSalamada. All rights reserved.
//

import Foundation
import CoreData

class WallpaperCoreData {
    static let share = WallpaperCoreData()
    
    func saveData(index:String?) {
        let wallpaperEntity = Images(context: AppDelegate.context)
        wallpaperEntity.index = index
        AppDelegate.saveContext()
    }
    func getAllData() -> [Images]{
        let fetchRequest = NSFetchRequest<Images>(entityName: "Images")
        let result = try? AppDelegate.context.fetch(fetchRequest)
        guard let entity = result else {
            return []
        }
        return entity
    }
    func getID() -> String{
  
        let fetchRequest = NSFetchRequest<Images>(entityName: "Images")
        let result = try? AppDelegate.context.fetch(fetchRequest)
        guard let entity = result?.last else {
            return ""
        }
        return entity.index!
    }
   
}
