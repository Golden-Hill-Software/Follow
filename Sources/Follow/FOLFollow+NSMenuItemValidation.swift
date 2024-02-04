//
//  FOLFollow+NSMenuItemValidation.swift
//
//
//  Created by John Brayton on 2/2/24.
//

#if os(macOS)
import AppKit

extension FOLFollow : NSMenuItemValidation {

    public func validateMenuItem(_ menuItem: NSMenuItem) -> Bool {
        if menuItem.action == #selector(handleFediverseMenuItem(_:)) {
            if let fediverseProfile = FOLFollow.fediverseProfile {
                let options = FOLFediverseClientUtilities.options(forFediverseProfile: fediverseProfile)
                menuItem.submenu = self.menu(forOptions: options, parentMenuItem: menuItem)
            } else {
                print("FOLFollow.fediverseProfile is not set.")
                return false
            }
        }
        if menuItem.action == #selector(handleFeedMenuItem(_:)) {
            if let feedProfile = FOLFollow.feedProfile {
                let options = FOLFeedReaderUtilities.options(forFeedProfile: feedProfile)
                menuItem.submenu = self.menu(forOptions: options, parentMenuItem: menuItem)
            } else {
                print("FOLFollow.feedProfile is not set.")
                return false
            }
        }
        return true
    }
    
}
#endif
