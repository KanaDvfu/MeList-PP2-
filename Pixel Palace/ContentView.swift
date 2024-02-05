//
//  ContentView.swift
//  Pixel Palace
//
//  Created by Евгений Канашкин on 05.02.2024.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item> 

	/// REMOVE THIS
	private func addItem() {
		AddItemF(viewContext: viewContext)
	}
	/// AND THIS SHIT
	private func deleteAllItemsF() {
		for item in items {
			DeleteItemF(viewContext: viewContext, item: item)
		}
	}
	
	/// Main Window View
    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
					
					/// Menu view
					NavigationLink {
						Text("Item at \(item.timestamp!, formatter: itemFormatter) \(item.itemID!)")
					}
					/// Sidebar view
					label: {
						Text(item.timestamp!, formatter: itemFormatter)
					}
					.contextMenu {
						ContextMenu(item: item, viewContext: viewContext)
					}
				}
			}
			.toolbar {
				ToolbarItem {
					Button(action: addItem) {
						Label("Show/Hide Toolbar", systemImage: "sidebar.left")
					}
					.keyboardShortcut("T")
				}
				ToolbarItem {
					Button(action: addItem) {
						Label("Add Item", systemImage: "plus")
					}
					.keyboardShortcut("+")
				}
				ToolbarItem {
					Button(action: deleteAllItemsF) {
						Label("Delete All Items", systemImage: "exclamationmark.arrow.circlepath")
					}
					.keyboardShortcut(.delete)
				}
			}
			///Default menu view
			Text("Select an item")
		}
		HStack {
			Text("Hello")
		}
    }
}

internal let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()
