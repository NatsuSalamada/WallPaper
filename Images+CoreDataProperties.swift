//
//  Images+CoreDataProperties.swift
//  
//
//  Created by User on 7/11/18.
//
//

import Foundation
import CoreData


extension Images {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Images> {
        return NSFetchRequest<Images>(entityName: "Images")
    }
    @NSManaged public var index: String?

}
