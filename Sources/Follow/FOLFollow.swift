//
//  FOLFollow.swift
//
//
//  Created by John Brayton on 2/2/24.
//

import Foundation
#if os(macOS)
import AppKit
#endif

@objc
public class FOLFollow : NSObject {
    
    public static var fediverseProfile: FOLFediverseProfile? = nil
    
    /*
        This does nothing, but its existence lets validateMenuItem(_:) get called (in FOLFollow+NSMenuItemValidation).
        That populates the submenu.
     */
    @IBAction
    public func handleFollowOnFediverse( _ input: Any ) {
        
    }
    
    @objc
    func handleGeneratedMenuItem( _ input: NSMenuItem ) {
        if let actionString = input.identifier?.rawValue, let action = FOLAction.fromString(actionString) {
            switch action {
            case .copy(let string):
                NSPasteboard.general.clearContents()
                NSPasteboard.general.setString(string, forType: .string)
            case .open(let url, _):
                NSWorkspace.shared.open(url)
            }
        }
    }
    
    func menu( forOptions options: [FOLOption], parentMenuItem: NSMenuItem ) -> NSMenu {
        var menuItems = [NSMenuItem]()
        
        for option in options {
            switch option {
            case .action( let name, let action ):
                switch action {
                case .copy( let string ):
                    let menuItem = NSMenuItem(title: name, action: #selector(handleGeneratedMenuItem(_:)), keyEquivalent: "")
                    menuItem.target = self
                    menuItem.identifier = NSUserInterfaceItemIdentifier(rawValue: String(format: "copy:%@", string))
                    menuItems.append(menuItem)
                case .open( let url, let applicationPath ):
                    let menuItem = NSMenuItem(title: name, action: #selector(handleGeneratedMenuItem(_:)), keyEquivalent: "")
                    menuItem.target = self
                    menuItem.identifier = NSUserInterfaceItemIdentifier(rawValue: String(format: "open:%@", url.absoluteString))
                    if let applicationPath {
                        let dimensionSize = 16.0
                        let image = NSWorkspace.shared.icon(forFile: applicationPath).FOL_resized(to: NSSize(width: dimensionSize, height: dimensionSize))
                        menuItem.image = image
                    }
                    menuItems.append(menuItem)
                }
            case .separator:
                menuItems.append(.separator())
            }
        }
        
        let menu = NSMenu(title: parentMenuItem.title)
        menu.items = menuItems
        return menu
    }
    
}
