//
//  RenameItemF.swift
//  Pixel Palace
//
//  Created by Евгений Канашкин on 08.02.2024.
//

import SwiftUI

func RenameItemF(viewContext: NSManagedObjectContext, item: Item, text: String) {
	withAnimation {
		item.text = text
		
		do {
			try viewContext.save()
		} catch {
			let nsError = error as NSError
			fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
		}
	}
}
