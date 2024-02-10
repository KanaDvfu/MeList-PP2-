//
//  RenameItem.swift
//  Pixel Palace
//
//  Created by Евгений Канашкин on 08.02.2024.
//

import SwiftUI

internal struct RenameItem: View {
	let item: Item
	var viewContext: NSManagedObjectContext
	
	@Binding var focusedSidebarItem: String
	
//	Do not needed as long as focusedSidebarItem is updated
//	@Binding var updateState: String
	
    var body: some View {
		Button("Rename Item") {
			focusedSidebarItem = item.itemID?.uuidString ?? ""
		}
    }
}
