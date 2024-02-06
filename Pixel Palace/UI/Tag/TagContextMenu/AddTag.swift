//
//  AddTag.swift
//  Pixel Palace
//
//  Created by Евгений Канашкин on 06.02.2024.
//

import SwiftUI

internal struct AddTag: View {
	var viewContext: NSManagedObjectContext
	
	func addTag() {
		AddTagF(viewContext: viewContext)
	}
	
	var body: some View {
		Button(action: {
			addTag()
		}) {
			Text("Add Tag")
		}
		.keyboardShortcut("+")
	}
}
