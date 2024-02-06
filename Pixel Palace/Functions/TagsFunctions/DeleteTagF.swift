//
//  Tags.swift
//  Pixel Palace
//
//  Created by Евгений Канашкин on 06.02.2024.
//

import SwiftUI

func DeleteTagF(viewContext: NSManagedObjectContext, tag: Tag) {
	withAnimation {
		viewContext.delete(tag)
		
		do {
			try viewContext.save()
		} catch {
			let nsError = error as NSError
			fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
		}
	}
}
