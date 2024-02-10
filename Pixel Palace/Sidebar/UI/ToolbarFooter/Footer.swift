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
	
	@Binding var updateState: String
	
	private func addItem() {
		AddItemF(viewContext: viewContext)
		updateState = ManualUpdate()
	}
	
	var body: some View {
		HStack {
			Button(action: addItem) {
				Label("Add Note", systemImage: "plus.rectangle.fill.on.folder.fill")
			}
			.keyboardShortcut("+")
			.buttonStyle(.borderless)
			.opacity(isHovered ? 0.69 : 1.0)
			.font(.headline)
			.foregroundColor(isHovered ? Color("AccentColor") : Color.gray)
			.onHover{hover in isHovered.toggle()}
			Spacer()
			Text("CMK🐱").foregroundColor(Color("AccentColor"))
		}.padding([.bottom, .leading, .trailing], 10)
	}
}
