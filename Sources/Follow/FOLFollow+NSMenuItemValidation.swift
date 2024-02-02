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
            
        }
        return true
    }
    
}
