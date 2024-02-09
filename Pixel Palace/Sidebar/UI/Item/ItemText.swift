//
//  ItemText.swift
//  Pixel Palace
//
//  Created by Евгений Канашкин on 09.02.2024.
//

import SwiftUI

internal struct ItemText: View {
	var item: Item
	var FS: Bool
	
    var body: some View {
		HStack {
			Text(item.text ?? "")
			Spacer()
		}
		.opacity(FS ? 0 : 1)
    }
}
