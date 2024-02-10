//
//  ItemTextField.swift
//  Pixel Palace
//
//  Created by Евгений Канашкин on 09.02.2024.
//

import SwiftUI

internal struct ItemTextField: View {
	var viewContext: NSManagedObjectContext
	let item: Item
	
	@State private var text = ""
	
	@Binding var focusedSidebarItem: String
	@Binding var updateState:String
	
	var FS: Bool
	
    var body: some View {
		HStack {
			TextField(item.text ?? "", text: $text)
				.onSubmit {
					RenameItemF(viewContext: viewContext, item: item, text: text)
					focusedSidebarItem = ""
					updateState = ManualUpdate()
				}
			Image(systemName: "arrow.left")
		}
		.disabled(!FS)
		.opacity(FS ? 1 : 0)
    }
}
