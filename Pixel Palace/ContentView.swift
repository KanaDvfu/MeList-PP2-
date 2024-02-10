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
		sortDescriptors: [NSSortDescriptor(keyPath: \Item.text, ascending: true)],
		animation: .default)
	private var items: FetchedResults<Item>
	
	@State private var focusedSidebarItem = ""
	@State private var alert = false
	
	/// Main Window View
	var body: some View {
		NavigationView {
			List {
				Section("Folders") {
					ForEach(items) { item in
						NavigationLink {
							MainItem(viewContext: viewContext, item: item, focusedSidebarItem: $focusedSidebarItem)
						} label: {
							SidebarItem(viewContext: viewContext, item: item, focusedSidebarItem: $focusedSidebarItem)
						}.contextMenu {
							ItemContextMenu(viewContext: viewContext, item: item, focusedSidebarItem: $focusedSidebarItem)
						}
					}
				}
			}.frame(minWidth: 200, idealWidth: 500)
				.toolbar {
					Toolbar(viewContext: viewContext, items: items, alert: $alert)
				}
			DefaultMainItem()
		}.frame(minWidth: 400, minHeight: 400)
		Footer(viewContext: viewContext, focusedSidebarItem: $focusedSidebarItem)
	}
}

internal let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    formatter.timeStyle = .short
    return formatter
}()
