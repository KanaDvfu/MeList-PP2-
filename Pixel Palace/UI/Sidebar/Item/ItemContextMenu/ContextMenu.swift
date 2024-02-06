//
//  ItemContextMenu.swift
//  Pixel Palace
//
//  Created by Евгений Канашкин on 05.02.2024.
//

import SwiftUI

///All elements in this view are made non accessible further.
struct ItemContextMenu: View {
	let item: Item
	var viewContext: NSManagedObjectContext
	
    var body: some View {
        DeleteItem(item: item, viewContext: viewContext)
		AddItem(viewContext: viewContext)
    }
}
