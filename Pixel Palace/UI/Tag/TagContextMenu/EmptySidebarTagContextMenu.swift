//
//  EmptySidebarTagContextMenu.swift
//  Pixel Palace
//
//  Created by Евгений Канашкин on 06.02.2024.
//

import SwiftUI

struct EmptySidebarTagContextMenu: View {
	var viewContext: NSManagedObjectContext
	
	var body: some View {
		AddTag(viewContext: viewContext)
	}
}
