//
//  FOLAction.swift
//
//
//  Created by John Brayton on 2/2/24.
//

import Foundation

enum FOLAction : Equatable {
    
    case copy( string: String )
    
    // On macOS, the applicationPath is the path to the application that will open non-HTTP(S)
    // URLs. This can be used to display the application icon.
    case open( url: URL, applicationPath: String? )
    
    // On macOS, the action is encoded into the NSMenuItem's user interface identifier.
    // We end up losing the application path, but we do not need it at the point where
    // we are decoding it from the NSMenuItem.
    static func fromString( _ inputString: String ) -> FOLAction? {
        let split = inputString.split(separator: ":", maxSplits: 1)
        guard split.count == 2 else {
            return nil
        }
        if split[0] == "copy" {
            return .copy(string: String(split[1]))
        }
        if split[0] == "open", let url = URL(string: String(split[1])) {
            return .open(url: url, applicationPath: nil)
        }
        return nil
    }
    
}
