//
//  ContentView.swift
//  Pixel Palace
//
//  Created by Евгений Канашкин on 05.02.2024.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item> 

	
	/// Main Window View
    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
					/// Item menu view
                    NavigationLink {
						Text("Item at \(item.timestamp!, formatter: itemFormatter) \(item.itemID!)")
                    } label: {
                        Text(item.timestamp!, formatter: itemFormatter)
					}
					
					.contextMenu {
						ContextMenu(item: item, viewContext: viewContext)
					}
                }
			}
			
			///Toolbar view
            .toolbar {
				ToolbarItem {
					Button(action: addItem) {
						Label("Show/Hide Toolbar", systemImage: "sidebar.left")
					}
				}
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
					}
					.keyboardShortcut("+")
                }
            }
			
			///Default menu view
            Text("Select an item")
        }
    }

	private func addItem() {
		withAnimation {
			let newItem = Item(context: viewContext)
			newItem.timestamp = Date()
			newItem.itemID = UUID()
			
			do {
				try viewContext.save()
			} catch {
				let nsError = error as NSError
				fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
			}
		}
	}
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
