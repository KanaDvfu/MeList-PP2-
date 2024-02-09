//
//  DeleteButton.swift
//  Pixel Palace
//
//  Created by Евгений Канашкин on 05.02.2024.
//

import SwiftUI

internal struct DeleteItem: View {
	let item: Item
	var viewContext: NSManagedObjectContext
	
	@Binding var focusedSidebarItem: String
	
	private func deleteItem() {
		DeleteItemF(viewContext: viewContext, item: item)
		focusedSidebarItem = ManualUpdate()
	}
	
	var body: some View {
		Button("Delete Item") {
			deleteItem()
		}
		.keyboardShortcut(.delete)
	}
}
