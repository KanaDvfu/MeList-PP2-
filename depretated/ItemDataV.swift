////
////  ItemDataV.swift
////  Pixel Palace
////
////  Created by Евгений Канашкин on 11.02.2024.
////
//
//import SwiftUI
//
//struct ItemDataV: View {
//	var viewContext: NSManagedObjectContext
//	var data: ItemData
//	
//	@Binding var updateState: String
//	
//	@State private var text = ""
//	
//	private func deleteData() {
//		DeleteDataF(viewContext: viewContext, data: data)
//		updateState = ManualUpdate()
//	}
//	
//	var body: some View {
//		VStack {
//			HStack {
//				TextField(
//					data.text ?? "",
//					text: $text
//				)
//				.textFieldStyle(.roundedBorder)
//				.onSubmit{
//					data.text = text
//					updateState = ManualUpdate()
//				}
//				Button (action: deleteData) {
//					Image(systemName: "trash")
//				}
//			}
//		}
//	}
//}
