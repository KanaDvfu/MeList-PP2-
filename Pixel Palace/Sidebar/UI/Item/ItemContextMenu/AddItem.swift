//
//  AddItem.swift
//  Pixel Palace
//
//  Created by Евгений Канашкин on 05.02.2024.
//

import SwiftUI

internal struct AddItem: View {
	var viewContext: NSManagedObjectContext
	
	@Binding var focusedSidebarItem: String
	
	private func addItem() {
		AddItemF(viewContext: viewContext)
		focusedSidebarItem = ManualUpdate()
	}
	
    var body: some View {
		Button("Add Item") {
			addItem()
		}
		.keyboardShortcut("+")
    }
}
