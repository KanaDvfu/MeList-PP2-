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
	
	/// Main Window View
	var body: some View {
		NavigationView {
			List {
				Section {
					ForEach(items) { item in
						
						NavigationLink {
							
							Text("ItemID: \(item.itemID!)")
							Text("Item Text: \(item.text!)")
								.navigationTitle("Pixel Palace testtest")
							
						} label: {
							SidebarItem(item: item)
						}
						.contextMenu {
							ItemContextMenu(item: item, viewContext: viewContext)
						}
					}
				} header: {
					SidebarSectionHeader()
				}
			}
			.toolbar {
				Toolbar(viewContext: viewContext, items: items)
			}
			
			///Default menu view
			Text("Select an item")
				.navigationTitle("Pixel Palace pupu")
		}
		Footer(viewContext: viewContext)
	}
}

internal let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    formatter.timeStyle = .short
    return formatter
}()
