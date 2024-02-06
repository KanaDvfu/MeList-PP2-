//
//  Footer.swift
//  Pixel Palace
//
//  Created by Евгений Канашкин on 06.02.2024.
//

import SwiftUI

struct Footer: View {
	var viewContext: NSManagedObjectContext
	
	@State private var isHovered = false
	
	private func addItem() {
		AddItemF(viewContext: viewContext)
	}
	
	var body: some View {
		HStack {
			Button(action: addItem) {
				Label("Add Item", systemImage: "plus")
			}
			.keyboardShortcut("+")
			.buttonStyle(.borderless)
			.opacity(isHovered ? 0.69 : 1.0)
			.foregroundColor(isHovered ? Color("AccentColor") : Color.gray)
			.onHover{hover in isHovered.toggle()}
			.padding([.trailing], 10)
			Spacer()
		}.padding([.bottom, .leading], 10)
	}
}
