//
//  TagContextMenu.swift
//  Pixel Palace
//
//  Created by Евгений Канашкин on 06.02.2024.
//

import SwiftUI

struct TagContextMenu: View {
	let tag: Tag
	var viewContext: NSManagedObjectContext
	
    var body: some View {
		AddTag(viewContext: viewContext)
		DeleteTag(tag: tag, viewContext: viewContext)
    }
}
