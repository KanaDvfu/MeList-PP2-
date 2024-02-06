//
//  SidebarTag.swift
//  Pixel Palace
//
//  Created by Евгений Канашкин on 06.02.2024.
//

import SwiftUI

struct SidebarTag: View {
	var tag: Tag
	
	@State private var isHovered = false
	
    var body: some View {
		HStack {
			ZStack (alignment: .center) {
				Image(systemName: "seal.fill").colorMultiply(TagColor(string: tag.color ?? "black")).font(.title2)
				Text("\(tag.tagToItem?.count ?? 0)").frame(alignment: .center)
			}.fixedSize()
			Text("\(tag.tagID ?? UUID())")
		}
		.opacity(isHovered ? 0.69 : 1.0)
		.onHover{hover in isHovered.toggle()}
    }
}
