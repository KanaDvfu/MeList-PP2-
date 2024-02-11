//
//  ItemDataV.swift
//  Pixel Palace
//
//  Created by Евгений Канашкин on 11.02.2024.
//

import SwiftUI

struct ItemDataV: View {
	var data: ItemData
	
    var body: some View {
		Label("💀\(data.text!)", systemImage: "sunset.fill")
    }
}
