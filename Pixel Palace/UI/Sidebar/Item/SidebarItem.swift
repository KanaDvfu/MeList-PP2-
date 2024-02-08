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
	@State private var text = ""

	@Binding var focusedSidebarItem: String
	
	private func FS() -> Bool {
		return item.itemID?.uuidString == focusedSidebarItem
	}
	
    var body: some View {
		HStack {
			Image(systemName: "doc.fill")
			ZStack {
				TextField(item.text ?? "", text: $text)
					.onSubmit {
						RenameItemF(viewContext: viewContext, item: item, text: text)
						focusedSidebarItem = ""
					}
					.disabled(!FS())
					.opacity(FS() ? 1 : 0)
				HStack {
					Text(item.text ?? "")
						.opacity(FS() ? 0 : 1)
					Spacer()
				}
			}
			Spacer()
			Text(FS() ? "Y" : "N")
		}
		.opacity(isHovered ? 0.69 : 1.0)
		.foregroundColor(isHovered ? Color("AccentColor") : Color.white)
		.onHover{hover in isHovered.toggle()}
    }
}
