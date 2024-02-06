//
//  TagColor.swift
//  Pixel Palace
//
//  Created by Евгений Канашкин on 06.02.2024.
//

import SwiftUI

let TagColors: [String: Color] = [
	"green": .green,
	"blue": .blue,
	"yellow": .yellow,
	"red": .red
]

func TagColor(string: String) -> Color {
	if let color = TagColors[string] {
		return color
	} else {
		return Color(.black)
	}
}
