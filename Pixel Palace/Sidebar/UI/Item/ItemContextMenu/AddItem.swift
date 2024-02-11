//
//  AddItem.swift
//  Pixel Palace
//
//  Created by Евгений Канашкин on 05.02.2024.
//

import SwiftUI

internal struct AddItem: View {
	var viewContext: NSManagedObjectContext
	
	@Binding var updateState: String
	
	private func addItem() {
		AddItemF(viewContext: viewContext)
		updateState = ManualUpdate()
	}
	
    var body: some View {
		Button("Add Note") {
			addItem()
		}
		.keyboardShortcut("+")
    }
}
