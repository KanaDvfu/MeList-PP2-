//
//  MainItem.swift
//  Pixel Palace
//
//  Created by Евгений Канашкин on 07.02.2024.
//

import SwiftUI

struct MainItem: View {
	var viewContext: NSManagedObjectContext
	
	@State var item: Item
	
	let minMainItemWidth: CGFloat
	
	@Binding var updateState: String
	
	var body: some View {
		
		ZStack {
		
			if item.itemID != nil {
				TextEditor(text: $item.longtext)
					.font(.title3)
					.navigationTitle(item.text == "" ? "MyList" : item.text!)
			}
			
			DefaultMainItem(minMainItemWidth: minMainItemWidth)
				.opacity(item.itemID == nil ? 1 : 0)
				.disabled(true)
		}
	}
}
