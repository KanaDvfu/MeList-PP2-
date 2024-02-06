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
	
    var body: some ToolbarContent {
		ToolbarItemGroup {
			Button(action: deleteAllItems) {
				Image(systemName: "sidebar.left")
			}
			.keyboardShortcut("T")
			
			Button(action: deleteAllItems) {
				Image(systemName: "exclamationmark.arrow.circlepath")
			}
			.keyboardShortcut(.delete)
		}
    }
}
