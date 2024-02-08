//
//  Pixel_PalaceApp.swift
//  Pixel Palace
//
//  Created by Евгений Канашкин on 05.02.2024.
//

import SwiftUI

@main
struct Pixel_PalaceApp: App {
    let persistenceController = PersistenceController.shared
	
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
		.commands {
			SidebarCommands()
		}
    }
}
