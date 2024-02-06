//
//  AddTagF.swift
//  Pixel Palace
//
//  Created by Евгений Канашкин on 06.02.2024.
//

import SwiftUI

func AddTagF(viewContext: NSManagedObjectContext) {
	withAnimation {
		let newTag = Tag(context: viewContext)
		newTag.color = "green"
		newTag.tagID = UUID()
		newTag.text = ""
		
		do {
			try viewContext.save()
		} catch {
			let nsError = error as NSError
			fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
		}
	}
}
