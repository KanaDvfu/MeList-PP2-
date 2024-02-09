//
//  DeleteItem.swift
//  Pixel Palace
//
//  Created by Евгений Канашкин on 05.02.2024.
//

import SwiftUI

/// Visual bug: on deleting last item mainItem don't update
/// Ways to fix: none. Can't pass nil in mainItem to update. Update viewContext doesn't seem to help neither. Only solution is to update to 13.0 macOS or newer.
/// What to do: Настоящий мужчина сначала терпит-терпит, а потом терпит-терпит
func DeleteItemF(viewContext: NSManagedObjectContext, item: Item) {
	withAnimation {
		viewContext.delete(item)
		
		do {
			try viewContext.save()
		} catch {
			let nsError = error as NSError
			fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
		}
		viewContext.refreshAllObjects()
	}
}
