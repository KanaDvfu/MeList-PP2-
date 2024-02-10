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
	
	@Binding var updateState: String
	
	private func addData() {
		AddDataF(viewContext: viewContext, item: item)
		updateState = ManualUpdate()
	}
	
    var body: some View {
		if item.itemID == nil {
			Text("Deletion is complete").font(.title)
			Text("Hope you will not complain later ⍩")
				.navigationTitle("Pixel Palace")
		} else {
			Text(item.itemID!.uuidString)
				.navigationTitle(item.text!)
		}
		
//
//		List {
//
//			ForEach(item.itemData) {data in
//				Label(data.text!, systemImage: "checkmark.circle.trianglebadge.exclamationmark")
//			}
//		}
//		Button(action: addData) {
//			Label("Add Data", systemImage: "plus.rectangle.on.rectangle.fill")
//		}
    }
}
