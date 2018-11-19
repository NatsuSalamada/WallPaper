//
//  Livephoto+CoreDataProperties.swift
//  
//
//  Created by Bé Nhện Của Bé Thảo on 02/08/2018.
//
//

import Foundation
import CoreData


extension Livephoto {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Livephoto> {
        return NSFetchRequest<Livephoto>(entityName: "Livephoto")
    }

    @NSManaged public var id: String?
    @NSManaged public var linkDataMOV: String?
    @NSManaged public var linkDataIMG: String?

}
