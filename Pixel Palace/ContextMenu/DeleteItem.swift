//
//  DeleteButton.swift
//  Pixel Palace
//
//  Created by Евгений Канашкин on 05.02.2024.
//

import SwiftUI

struct DeleteItem: View {
	let item: Item
	var viewContext: NSManagedObjectContext
	
	var body: some View {
		Button(action: {
			withAnimation {
				viewContext.delete(item)
				
				do {
					try viewContext.save()
				} catch {
					let nsError = error as NSError
					fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
				}
			}
		})
		{ Text("Delete Item") }
			.keyboardShortcut(.delete)
	}
}
