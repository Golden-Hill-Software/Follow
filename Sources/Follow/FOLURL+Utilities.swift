//
//  FOLURL+Utilities.swift
//
//
//  Created by John Brayton on 2/2/24.
//

import Foundation
#if os(macOS)
import AppKit
#else
import UIKit
#endif

extension URL {
    
    var FOL_canOpen: FOLURLAvailability {
#if os(macOS)
        if let url = NSWorkspace.shared.urlForApplication(toOpen: self) {
            return FOLURLAvailability.canOpen(applicationPath: url.path(percentEncoded: false))
        } else {
            return FOLURLAvailability.cannotOpen
        }
#else
        return UIApplication.shared.canOpenURL(self)
#endif
    }
    
}
