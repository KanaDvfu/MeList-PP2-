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
		sortDescriptors: [NSSortDescriptor(keyPath: \Item.itemID, ascending: true)],
		animation: .default)
	private var items: FetchedResults<Item>
	
	///Test
	
	/// Main Window View
	var body: some View {
		NavigationView {
			List {
				ForEach(items) { item in
					
					NavigationLink {
						Text("Item at \(item.timestamp!, formatter: itemFormatter) \(item.itemID!)")
					} label: {
						SidebarElement(item: item)
					}
					.contextMenu {
						ContextMenu(item: item, viewContext: viewContext)
					}
				}
			}
			.toolbar {
				Toolbar(viewContext: viewContext, items: items)
			}
			
			///Default menu view
			Text("Select an item")
				.navigationTitle("Pixel Palace pupu")
		}
	}
}

internal let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()
