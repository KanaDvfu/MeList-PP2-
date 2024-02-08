//
//  AddItem.swift
//  Pixel Palace
//
//  Created by Евгений Канашкин on 05.02.2024.
//

import SwiftUI

func AddItemF(viewContext: NSManagedObjectContext) {
	withAnimation {
		let newItem = Item(context: viewContext)
		newItem.itemID = UUID()
		newItem.text = ""
		
		do {
			try viewContext.save()
		} catch {
			let nsError = error as NSError
			fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
		}
	}
}
