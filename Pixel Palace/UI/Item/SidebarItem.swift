//
//  SidebarItem.swift
//  Pixel Palace
//
//  Created by Евгений Канашкин on 05.02.2024.
//

import SwiftUI

struct SidebarItem: View {
	var item: Item
	
	@State private var isHovered = false
	
    var body: some View {
		HStack {
			Image(systemName: "folder.fill")
			Text(item.timestamp ?? Date(), formatter: itemFormatter)
		}
		.opacity(isHovered ? 0.69 : 1.0)
		.onHover{hover in isHovered.toggle()}
    }
}
