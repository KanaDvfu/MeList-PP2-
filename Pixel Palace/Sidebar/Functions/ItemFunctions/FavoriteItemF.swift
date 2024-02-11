//
//  FavoriteItemF.swift
//  Pixel Palace
//
//  Created by Евгений Канашкин on 11.02.2024.
//

import SwiftUI

func FavoriteItemF(viewContext: NSManagedObjectContext, item: Item) {
	withAnimation {
		item.isFavorite.toggle()
		
		do {
			try viewContext.save()
		} catch {
			let nsError = error as NSError
			fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
		}
	}
}
