//
//  FOLAction.swift
//
//
//  Created by John Brayton on 2/2/24.
//

import Foundation

enum FOLAction : Equatable {
    
    case copy( string: String )
    case open( url: URL )
    
    static func fromString( _ inputString: String ) -> FOLAction? {
        let split = inputString.split(separator: ":", maxSplits: 1)
        guard split.count == 2 else {
            return nil
        }
        if split[0] == "copy" {
            return .copy(string: String(split[1]))
        }
        if split[0] == "open", let url = URL(string: String(split[1])) {
            return .open(url: url)
        }
        return nil
    }
    
}
