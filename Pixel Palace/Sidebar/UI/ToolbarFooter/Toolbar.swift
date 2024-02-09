//
//  Toolbar.swift
//  Pixel Palace
//
//  Created by Евгений Канашкин on 06.02.2024.
//

import SwiftUI

struct Toolbar: ToolbarContent {
	var viewContext: NSManagedObjectContext
	var items: FetchedResults<Item>
	
	private func deleteAllItems() {
		DeleteAllItemsF(viewContext: viewContext, items: items)
	}
	
	private func toggleSidebar() {
		ToggleSidebarF()
	}
	
    var body: some ToolbarContent {
		ToolbarItemGroup {
			Button(action: toggleSidebar) {
				Image(systemName: "sidebar.left")
			}
			.keyboardShortcut("S", modifiers: [.control, .command])
			
			Button(action: deleteAllItems) {
				Image(systemName: "trash.fill").foregroundColor(.red).opacity(0.69)
			}
			.keyboardShortcut(.delete, modifiers: [.control, .command])
		}
    }
}
