//
//  DeleteItem.swift
//  Pixel Palace
//
//  Created by Евгений Канашкин on 05.02.2024.
//

import SwiftUI

func DeleteItemF(viewContext: NSManagedObjectContext, item: Item) {
	withAnimation {
		viewContext.delete(item)
		
		do {
			try viewContext.save()
			viewContext.refreshAllObjects()
		} catch {
			let nsError = error as NSError
			fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
		}
	}
}
