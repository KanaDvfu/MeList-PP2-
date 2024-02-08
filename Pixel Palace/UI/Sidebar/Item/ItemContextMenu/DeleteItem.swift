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
	
	private func deleteItem() {
		DeleteItemF(viewContext: viewContext, item: item)
	}
	
	var body: some View {
		Button("Delete Item") {
			deleteItem()
		}
		.keyboardShortcut(.delete)
	}
}
