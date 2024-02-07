//
//  MainItem.swift
//  Pixel Palace
//
//  Created by Евгений Канашкин on 07.02.2024.
//

import SwiftUI

struct MainItem: View {
	let item: Item
	
    var body: some View {
		
		Text("ItemID: \(item.itemID!)")
		Text("Item Text: \(item.text!)")
			.navigationTitle("Pixel Palace testtest")
		
    }
}
