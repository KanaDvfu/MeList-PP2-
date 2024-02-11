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
	let minMainItemWidth: CGFloat
	
	@Binding var updateState: String

//	private func addData() {
//		AddDataF(viewContext: viewContext, item: item)
//		updateState = ManualUpdate()
//	}
	
	var body: some View {
		
		ZStack {
		
			if item.itemID != nil {
				// MARK: put the view here!!!
				VStack {
					Text(item.itemID!.uuidString)
						.navigationTitle(item.text!)
						.opacity(item.itemID == nil ? 0 : 1)
					Text(item.isFavorite ? "Y" : "N")
				}
			}
			
			DefaultMainItem(minMainItemWidth: minMainItemWidth)
				.opacity(item.itemID == nil ? 1 : 0)
				.disabled(true)
		}

//		List {
//			ForEach(item.itemData) {data in
//				Label(data.text!, systemImage: "checkmark.circle.trianglebadge.exclamationmark")
//			}
//		}
//		Button(action: addData) {
//			Label("Add Data", systemImage: "plus.rectangle.on.rectangle.fill")
//		}
		
	}
}
