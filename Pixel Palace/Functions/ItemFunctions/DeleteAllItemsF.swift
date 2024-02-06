//
//  DeleteAllItemsF.swift
//  Pixel Palace
//
//  Created by Евгений Канашкин on 05.02.2024.
//

import SwiftUI

func DeleteAllItemsF(viewContext: NSManagedObjectContext, items: FetchedResults<Item>) {
	for item in items {
		DeleteItemF(viewContext: viewContext, item: item)
	}
}

