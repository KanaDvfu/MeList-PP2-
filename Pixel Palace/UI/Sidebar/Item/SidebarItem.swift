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
			Text(item.text ?? "")
			Spacer()
		}
		.opacity(isHovered ? 0.69 : 1.0)
		.foregroundColor(isHovered ? Color("AccentColor") : Color.gray)
		.onHover{hover in isHovered.toggle()}
    }
}
