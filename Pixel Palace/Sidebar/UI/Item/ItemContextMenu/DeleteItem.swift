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

	@Binding var updateState: String
	
	private func deleteItem() {
		DeleteItemF(viewContext: viewContext, item: item)
		updateState = ManualUpdate()
	}
	
	var body: some View {
		Button("Delete Note") {
			deleteItem()
		}
		.keyboardShortcut(.delete)
	}
}
