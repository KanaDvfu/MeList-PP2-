//
//  ItemData+CoreDataProperties.swift
//  Pixel Palace
//
//  Created by Евгений Канашкин on 09.02.2024.
//
//

import Foundation
import CoreData


extension ItemData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemData> {
        return NSFetchRequest<ItemData>(entityName: "ItemData")
    }

    @NSManaged public var itemID: UUID?
    @NSManaged public var dataID: UUID?
    @NSManaged public var image: Data?
    @NSManaged public var text: String?
    @NSManaged public var item: Item?

}

extension ItemData : Identifiable {

}
