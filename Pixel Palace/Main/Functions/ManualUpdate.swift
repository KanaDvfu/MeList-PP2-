//
//  ManualUpdate.swift
//  Pixel Palace
//
//  Created by Евгений Канашкин on 09.02.2024.
//

import Foundation

///	Manual update needed to update view when changes are made.
///	To do this it just update one string value.
///	To use it - make @State var :String in main View and @Binding it wherever you need it to update from.
///	After that pass non @Binding var to view you need to update manual.
func ManualUpdate() -> String {
	return UUID().uuidString.lowercased()
}
