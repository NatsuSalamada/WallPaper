//
//  Takephoto+CoreDataProperties.swift
//  
//
//  Created by Bé Nhện Của Bé Thảo on 01/08/2018.
//
//

import Foundation
import CoreData


extension Takephoto {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Takephoto> {
        return NSFetchRequest<Takephoto>(entityName: "Takephoto")
    }

    @NSManaged public var id: String?

}
