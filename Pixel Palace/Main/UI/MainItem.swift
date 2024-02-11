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
	
	var body: some View {
		
		ZStack {
		
			if item.itemID != nil {
				ItemV(viewContext: viewContext, item: item, updateState: $updateState)
			}
			
			DefaultMainItem(minMainItemWidth: minMainItemWidth)
				.opacity(item.itemID == nil ? 1 : 0)
				.disabled(true)
		}
	}
}
