//
//  SidebarItem.swift
//  Pixel Palace
//
//  Created by Евгений Канашкин on 05.02.2024.
//

import SwiftUI

struct SidebarItem: View {
	var viewContext: NSManagedObjectContext
	let item: Item
	
	@State private var isHovered = false

	@Binding var focusedSidebarItem: String
	@Binding var updateState: String
	
	private func FS() -> Bool {
		return item.itemID?.uuidString == focusedSidebarItem
	}
	
	private func toggleFavorite() {
		item.isFavorite.toggle()
	}
	
    var body: some View {
		HStack {
			Button (action: toggleFavorite) {
				item.isFavorite ? Image(systemName: "star.fill") : Image(systemName: "star")
			}
			.buttonStyle(.borderless)
			ZStack {
				ItemTextField(viewContext: viewContext, item: item, focusedSidebarItem: $focusedSidebarItem, updateState: $updateState, FS: FS())
				ItemText(item: item, FS: FS())
			}
		}
		.opacity(isHovered ? 0.69 : 1.0)
		.foregroundColor(isHovered ? Color("AccentColor") : Color.white)
		.onHover{hover in isHovered.toggle()}
    }
}
