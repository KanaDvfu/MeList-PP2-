//
//  ContentView.swift
//  Pixel Palace
//
//  Created by Евгений Канашкин on 05.02.2024.
//
//

import SwiftUI
import CoreData

struct ContentView: View {
	@Environment(\.managedObjectContext) private var viewContext
	
	// MARK: Swift sorts bools not in the way C/C++ do: false > true. That is why sortDescriptor is descending.
	
	@FetchRequest(
		sortDescriptors: [NSSortDescriptor(keyPath: \Item.isFavorite, ascending: false),
						  NSSortDescriptor(keyPath: \Item.text, ascending: true)],
		animation: .default)
	private var items: FetchedResults<Item>
	
	///	State of itemID which is needed to rename.
	@State private var focusedSidebarItem = ""
	
	/// State used to update main view on changing child views.
	///	Example: When changing itemData it updates the MainItem view, but not parent ContentView which causes visual bug in some scenarios.
	///	To max out chanses to update it is necessary to pass the state somewhere in the ContentView to make sure the app wil alwaysl update it. It will not update the state which is not used.
	@State private var updateState = ""
	
	/// State of alert for deleting all items function in Toolbar.
	@State private var isAlert = false
	
	///	Minimal width of MainItem.
	private var minMainItemWidth = 300.0
	
	var body: some View {
		NavigationView {
			List {
				Section("Notes") {
					ForEach(items) { item in
						NavigationLink {
							MainItem(viewContext: viewContext, item: item, minMainItemWidth: minMainItemWidth, updateState: $updateState)
						} label: {
							SidebarItem(viewContext: viewContext, item: item, focusedSidebarItem: $focusedSidebarItem, updateState: $updateState)
						}.contextMenu {
							ItemContextMenu(viewContext: viewContext, item: item, focusedSidebarItem: $focusedSidebarItem, updateState: $updateState)
						}
					}
				}
			}
			.frame(minWidth: 200)
			.toolbar {
				Toolbar(viewContext: viewContext, items: items, isAlert: $isAlert, updateState: $updateState)
			}
			
			///	VStack keeps the needed updateState, but makes it not visible.
			///	It also keeps it in ContentView so it updates always as updateState is.
			VStack {
				DefaultMainItem(minMainItemWidth: minMainItemWidth)
				Text("Update state: \(updateState)")
					.disabled(true)
					.opacity(0)
			}
		}
		Footer(viewContext: viewContext, updateState: $updateState)
	}
}

internal let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    formatter.timeStyle = .short
    return formatter
}()
