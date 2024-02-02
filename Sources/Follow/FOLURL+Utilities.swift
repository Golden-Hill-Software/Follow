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
    
    var FOL_canOpen: Bool {
#if os(macOS)
        return NSWorkspace.shared.urlForApplication(toOpen: self) != nil
#else
        return UIApplication.shared.canOpenURL(self)
#endif
    }
    
}
