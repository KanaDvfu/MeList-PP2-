//
//  ItemContextMenu.swift
//  Pixel Palace
//
//  Created by Евгений Канашкин on 05.02.2024.
//

import SwiftUI

///All elements in this view are made non accessible further.
struct ItemContextMenu: View {
	var viewContext: NSManagedObjectContext
	let item: Item
	
	@Binding var focusedSidebarItem: String
	
    var body: some View {
        DeleteItem(item: item, viewContext: viewContext)
		RenameItem(item: item, viewContext: viewContext, focusedSidebarItem: $focusedSidebarItem)
		Divider()
		AddItem(viewContext: viewContext)
    }
}
