//
//  ContextMenu.swift
//  Pixel Palace
//
//  Created by Евгений Канашкин on 05.02.2024.
//

import SwiftUI

struct ContextMenu: View {
	let item: Item
	var viewContext: NSManagedObjectContext
	
    var body: some View {
        DeleteItem(item: item, viewContext: viewContext)
		AddItem(viewContext: viewContext)
    }
}
