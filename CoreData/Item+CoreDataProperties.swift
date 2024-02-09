//
//  Item+CoreDataProperties.swift
//  Pixel Palace
//
//  Created by Евгений Канашкин on 09.02.2024.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var itemID: UUID?
    @NSManaged public var text: String?
    @NSManaged public var data: Set<ItemData>?

	public var itemData: [ItemData] {
		let setOfData = data ?? []
		return setOfData.sorted {
			($0.dataID?.uuidString ?? UUID().uuidString) < ($1.dataID?.uuidString ?? UUID().uuidString)
		}
	}
	
}

// MARK: Generated accessors for data
extension Item {

    @objc(addDataObject:)
    @NSManaged public func addToData(_ value: ItemData)

    @objc(removeDataObject:)
    @NSManaged public func removeFromData(_ value: ItemData)

    @objc(addData:)
    @NSManaged public func addToData(_ values: NSSet)

    @objc(removeData:)
    @NSManaged public func removeFromData(_ values: NSSet)

}

extension Item : Identifiable {

}
