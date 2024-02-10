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
	
	///	State of itemID which is needed to rename.
	@State private var focusedSidebarItem = ""
	
	/// State used to update main view on changing child views.
	///	Example: When changing itemData it updates the MainItem view, but not parent ContentView which causes visual bug in some scenarios.
	///	To max out chanses to update it is necessary to pass the state somewhere in the ContentView to make sure the app wil alwaysl update it. It will not update the state which is not used.
	@State private var updateState = ""
	
	/// State of alert for deleting all items function in Toolbar.
	@State private var isAlert = false
	
	var body: some View {
		NavigationView {
			List {
				Section("Notes") {
					ForEach(items) { item in
						NavigationLink {
							MainItem(viewContext: viewContext, item: item, updateState: $updateState)
						} label: {
							SidebarItem(viewContext: viewContext, item: item, focusedSidebarItem: $focusedSidebarItem, updateState: $updateState )
						}.contextMenu {
							ItemContextMenu(viewContext: viewContext, item: item, focusedSidebarItem: $focusedSidebarItem, updateState: $updateState)
						}
					}
				}
			}.frame(minWidth: 200, idealWidth: 500)
				.toolbar {
					Toolbar(viewContext: viewContext, items: items, isAlert: $isAlert, updateState: $updateState)
				}
			
			//	MARK: Put the startup window here
			Text("Update state: \(updateState)")
				.disabled(true).opacity(0)
		}.frame(minWidth: 400, minHeight: 400)
		Footer(viewContext: viewContext, updateState: $updateState)
	}
}

internal let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    formatter.timeStyle = .short
    return formatter
}()
