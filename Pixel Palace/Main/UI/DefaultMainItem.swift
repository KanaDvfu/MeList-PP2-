//
//  DefaultMainItem.swift
//  Pixel Palace
//
//  Created by Евгений Канашкин on 09.02.2024.
//

import SwiftUI

struct DefaultMainItem: View {
	let minMainItemWidth: CGFloat
	
	var body: some View {
		ZStack {
			VStack {
				
				VStack {
					Spacer()
					
					Text("Welcome")
						.font(.title)
						.navigationTitle("Pixel Palace")
					
					Spacer()
					
					
					Text("There is some tips about some functionality and buttons available:")
						.font(.title3)
					
					Spacer()
				}
				
				
				Divider()
				
				VStack {
					Label {
						Text(": shows and hides sidebar. Standard function of many apps.")
					} icon: {
						Image(systemName: "sidebar.left")
							.foregroundColor(Color.gray)
					}
					
					Divider()
					
					Label {
						Text(": deletes all notes. May be helpful in some scenarios.")
					} icon: {
						Image(systemName: "trash.fill")
							.foregroundColor(.red)
					}
					
					Divider()
					
					Label {
						Text(": as text says - creates new note.")
					} icon: {
						Label("Add Note", systemImage: "plus.rectangle.fill.on.folder.fill")
							.font(.headline)
							.foregroundColor(Color.gray)
					}
					
					Divider()
					
					Label {
						Text(": also you can right-click the existing notes in the sidebar to see things you can do.")
					} icon: {
						Image(systemName: "asterisk")
							.foregroundColor(Color.gray)
					}
					
					Divider()
					
					Text("Notes functionality is under development. But the text editor is available.")
						.font(.caption)
					
					Spacer()
				}
			}
			.font(.title3)
			
			Text("I'm here to make sure the width is okay")
				.padding([.horizontal], minMainItemWidth / 2)
				.disabled(true)
				.opacity(0)
		}
	}
}
