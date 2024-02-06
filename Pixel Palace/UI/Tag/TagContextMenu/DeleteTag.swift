//
//  DeleteTag.swift
//  Pixel Palace
//
//  Created by Евгений Канашкин on 06.02.2024.
//

import SwiftUI

internal struct DeleteTag: View {
	
	let tag: Tag
	var viewContext: NSManagedObjectContext
	
	func deleteTag() {
		DeleteTagF(viewContext: viewContext, tag: tag)
	}
	
	var body: some View {
		Button(action: {
			deleteTag()
		}) {
			Text("Delete Tag")
		}
		.keyboardShortcut(.delete)
	}
}
