//
//  FOLURLAvailability.swift
//
//
//  Created by John Brayton on 2/2/24.
//

import Foundation

enum FOLURLAvailability {
    
    // The system can open the URL. On macOS the applicationPath will be non-nil, and point to the
    // application that can open the URL. This is useful for getting the app icon.
    case canOpen(applicationPath: String?)
    
    // The system cannot open the URL.
    case cannotOpen
    
}
