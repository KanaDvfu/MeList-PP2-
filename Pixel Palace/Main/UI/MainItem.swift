//
//  MainItem.swift
//  Pixel Palace
//
//  Created by Евгений Канашкин on 11.02.2024.
//

import SwiftUI

struct MainItem: View {
	let item: Item
	
	@Binding var updateState: String
	
	var body: some View {
		ScrollView {
			VStack {
				Text(item.itemID!.uuidString)
					.opacity(item.itemID == nil ? 0 : 1)
				Text(item.isFavorite ? "Y" : "N")
			}
			.navigationTitle(item.text!)
		}
	}
}
