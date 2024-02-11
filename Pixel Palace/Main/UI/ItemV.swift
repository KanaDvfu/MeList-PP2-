//
//  ItemV.swift
//  Pixel Palace
//
//  Created by Евгений Канашкин on 11.02.2024.
//

import SwiftUI

struct ItemV: View {
	var viewContext: NSManagedObjectContext
	let item: Item
	
	@Binding var updateState: String

	private let columns = [
		GridItem(.flexible()),
		GridItem(.flexible()),
		GridItem(.flexible())
	]
	
	private func addData() {
		AddDataF(viewContext: viewContext, item: item)
		updateState = ManualUpdate()
	}
	
	var body: some View {
		VStack {
			ScrollView {
				LazyVGrid(
					columns: columns,
					alignment: .center,
					spacing: 16
				) {
					ForEach(item.itemData) {data in
						ItemDataV(data: data)
					}
				}
				.padding(10)
			}
			Button(action: addData) {
				Label("Add Data", systemImage: "plus.rectangle.on.rectangle.fill")
			}
		}
		.navigationTitle(item.text == nil ? "" : item.text!)
	}
}
