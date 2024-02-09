//
//  DeleteAllItemsF.swift
//  Pixel Palace
//
//  Created by Евгений Канашкин on 05.02.2024.
//

import SwiftUI

/// Visual bug: on deleting all items they keep visible in main window.
/// Ways to fix: none. Can't pass nil in mainItem to update. Update viewContext doesn't seem to help neither.
/// What to do: nothing. This function was made for debug only, when there was no deleteItemF function.
func DeleteAllItemsF(viewContext: NSManagedObjectContext, items: FetchedResults<Item>) {
	for item in items {
		DeleteItemF(viewContext: viewContext, item: item)
	}
}

