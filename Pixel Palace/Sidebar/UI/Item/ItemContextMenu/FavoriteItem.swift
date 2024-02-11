//
//  FavoriteItem.swift
//  Pixel Palace
//
//  Created by Евгений Канашкин on 11.02.2024.
//

import SwiftUI

internal struct FavoriteItem: View {
	let item: Item
	var viewContext: NSManagedObjectContext
	
//	MARK: Do not needed as long as focusedSidebarItem is updated
//	@Binding var updateState: String
	
	var body: some View {
		Button("Favorite Note") {
			item.isFavorite.toggle()
		}
	}
}

