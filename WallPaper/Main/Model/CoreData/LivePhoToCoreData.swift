//
//  LivePhoToCoreData.swift
//  WallPaper
//
//  Created by Bé Nhện Của Bé Thảo on 02/08/2018.
//  Copyright © 2018 NatsuSalamada. All rights reserved.
//


import CoreData

class LivePhoToCoreData{
    static let share = LivePhoToCoreData()
    func saveData(id:String,linkDataMOV:String,linkDataIMG:String) {
        let wallpaperEntity = Livephoto(context: AppDelegate.context)
        wallpaperEntity.id = id
        wallpaperEntity.linkDataMOV = linkDataMOV
        wallpaperEntity.linkDataIMG = linkDataIMG
        AppDelegate.saveContext()
    }
    func getAllData() -> [Livephoto]{
        let fetchRequest = NSFetchRequest<Livephoto>(entityName: "Livephoto")
        let result = try? AppDelegate.context.fetch(fetchRequest)
        guard let entity = result else {
            return []
        }
        return entity
    }
    func getDataWithId(id:String)->(String,String){
        let fetchRequest = NSFetchRequest<Livephoto>(entityName: "Livephoto")
        let result = try? AppDelegate.context.fetch(fetchRequest)
        guard let entity = result else {
           return ("nil","nil")
        }
        for en in entity{
            if en.id == id{
                return (en.linkDataMOV!,en.linkDataIMG!)
            }
        }
        return ("nil","nil")
    }
    func deleteAllData() {
        let fetchRequest = NSFetchRequest<Livephoto>(entityName: "Livephoto")
        fetchRequest.returnsObjectsAsFaults = false
        let result = try? AppDelegate.context.fetch(fetchRequest)
        guard let entity = result else {return }
        for object in entity {
            
            AppDelegate.context.delete(object)
        }
        
    }
}
