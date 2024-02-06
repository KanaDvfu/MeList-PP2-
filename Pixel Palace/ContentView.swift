//
//  ContentView.swift
//  Pixel Palace
//
//  Created by Евгений Канашкин on 05.02.2024.
//

import SwiftUI
import CoreData

extension Tag {
	public var itemsArray: [Item] {
		let set = tagToItem as? Set<Item> ?? []
		return set.sorted {
			$0.timestamp! < $1.timestamp!
		}
	}
}

struct ContentView: View {
	@Environment(\.managedObjectContext) private var viewContext
	
	@FetchRequest(
		sortDescriptors: [NSSortDescriptor(keyPath: \Item.itemID, ascending: true)],
		animation: .default)
	private var items: FetchedResults<Item>
	
	@FetchRequest(
		sortDescriptors: [NSSortDescriptor(keyPath: \Tag.tagID, ascending: true)],
		animation: .default)
	private var tags: FetchedResults<Tag>
	
	/// Main Window View
	var body: some View {
		NavigationView {
			List {
				Section("Folders") {
					ForEach(items) { item in
						
						NavigationLink {
							
							Text("Item at \(item.timestamp!, formatter: itemFormatter) \(item.itemID!)")
						} label: {
							SidebarItem(item: item)
						}
						.contextMenu {
							ItemContextMenu(item: item, viewContext: viewContext)
						}
					}
				}
				Divider()
				Section("Tags") {
					ForEach(tags) { tag in
						
						NavigationLink {
							
							Text("Tag at \(tag.color!) \(tag.tagID!)")
							List(tag.itemsArray) { itemInTag in
								Text(itemInTag.text ?? "empty tag text")
							}
						} label: {
							SidebarTag(tag: tag)
						}
						.contextMenu {
							TagContextMenu(tag: tag, viewContext: viewContext)
						}
					}
				}.contextMenu {
					!tags.isEmpty ?? 
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
