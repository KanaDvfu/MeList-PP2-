////
////  DeleteDataF.swift
////  Pixel Palace
////
////  Created by Евгений Канашкин on 12.02.2024.
////
//
//import SwiftUI
//
//func DeleteDataF(viewContext: NSManagedObjectContext, data: ItemData) {
//	withAnimation {
//		viewContext.delete(data)
//		
//		do {
//			try viewContext.save()
//		} catch {
//			let nsError = error as NSError
//			fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//		}
//	}
//}
