//
//  MainItem.swift
//  Pixel Palace
//
//  Created by Евгений Канашкин on 07.02.2024.
//

import SwiftUI

struct MainItem: View {
	var viewContext: NSManagedObjectContext
	let item: Item
	
	///Necessary to update the view, like navigation title, when item.text is changed and when adding new Data
	@Binding var focusedSidebarItem: String
	
	private func addData() {
		AddDataF(viewContext: viewContext, item: item)
		focusedSidebarItem = ManualUpdate()
	}
	
    var body: some View {
		Text("ItemID: \(item.itemID == nil ? "Error with itemID" : item.itemID!.uuidString)")
		List {
			
			ForEach(item.itemData) {data in
				Label(data.text!, systemImage: "checkmark.circle.trianglebadge.exclamationmark")
			}
		}
		Button(action: addData) {
			Label("Add Data", systemImage: "plus.rectangle.on.rectangle.fill")
		}
		.navigationTitle(item.text ?? "")
    }
}
