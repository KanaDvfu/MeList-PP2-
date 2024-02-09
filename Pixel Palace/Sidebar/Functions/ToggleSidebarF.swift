//
//  ToggleSidebarF.swift
//  Pixel Palace
//
//  Created by Евгений Канашкин on 07.02.2024.
//

import AppKit

func ToggleSidebarF() {
	NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
}
