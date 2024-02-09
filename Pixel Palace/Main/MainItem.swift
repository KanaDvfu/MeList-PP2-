//
//  MainItem.swift
//  Pixel Palace
//
//  Created by Евгений Канашкин on 07.02.2024.
//

import SwiftUI

struct MainItem: View {
	let item: Item
	
	///Necessary to update the view, like navigation title, when item.text is changed
	var focusedSidebarItem: String
	
    var body: some View {
		
		List {
			Text("ItemID: \(item.itemID!)")
		}
		.navigationTitle(item.text!)
    }
}
