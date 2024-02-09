//
//  AddDataF.swift
//  Pixel Palace
//
//  Created by Евгений Канашкин on 09.02.2024.
//

import SwiftUI

func AddDataF(viewContext: NSManagedObjectContext, item: Item) {
	withAnimation {
		let newItemData = ItemData(context: viewContext)
		newItemData.dataID = UUID()
		newItemData.item = item
		newItemData.text = ""
		newItemData.image = Data()
		
		do {
			try viewContext.save()
		} catch {
			let nsError = error as NSError
			fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
		}
	}
}
