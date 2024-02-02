//
//  FOLFollow+NSMenuItemValidation.swift
//
//
//  Created by John Brayton on 2/2/24.
//

import AppKit

extension FOLFollow : NSMenuItemValidation {

    public func validateMenuItem(_ menuItem: NSMenuItem) -> Bool {
        if menuItem.action == #selector(handleFollowOnFediverse(_:)) {
            if let fediverseProfile = FOLFollow.fediverseProfile {
                let options = FOLFediverseClientUtilities.options(forFediverseProfile: fediverseProfile)
                menuItem.submenu = self.menu(forOptions: options, parentMenuItem: menuItem)
            } else {
                print("FOLFollow.fediverseProfile is not set.")
                return false
            }
        }
        return true
    }
    
}
