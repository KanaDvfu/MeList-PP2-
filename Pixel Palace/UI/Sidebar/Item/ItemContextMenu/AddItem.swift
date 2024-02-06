//
//  AddItem.swift
//  Pixel Palace
//
//  Created by Евгений Канашкин on 05.02.2024.
//

import SwiftUI

internal struct AddItem: View {
	var viewContext: NSManagedObjectContext
	
	private func addItem() {
		AddItemF(viewContext: viewContext)
	}
	
    var body: some View {
		Button(action: {
			addItem()
		}) {
			Text("Add Item")
		}
		.keyboardShortcut("+")
    }
}
