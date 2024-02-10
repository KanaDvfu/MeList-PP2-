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
	
	private func toggleSidebar() {
		ToggleSidebarF()
	}
	
	@Binding var isAlert: Bool
	
	private func deleteAllItems() {
		DeleteAllItemsF(viewContext: viewContext, items: items)
	}
	
	private func toggleAlert() {
		isAlert.toggle()
	}
	
    var body: some ToolbarContent {
		ToolbarItemGroup {
			Button(action: toggleSidebar) {
				Image(systemName: "sidebar.left")
			}
			.keyboardShortcut("S", modifiers: [.control, .command])
			
			Button(action: toggleAlert) {
				Image(systemName: "trash.fill").foregroundColor(.red).opacity(0.69)
			}
			.keyboardShortcut(.delete, modifiers: [.control, .command])
			.alert(isPresented: $isAlert) {
				Alert(
					title: Text("Are you sure you want to delete all notes?"),
					message: Text("There is no undo"),
					primaryButton: .destructive(Text("Delete All")) {
						deleteAllItems()
					},
					secondaryButton: .cancel()
				)
			}
		}
    }
}
