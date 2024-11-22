//
//  FOLFediverseProfile.swift
//
//
//  Created by John Brayton on 2/2/24.
//

import Foundation

public struct FOLFediverseProfile {
    
    public let username: String
    public let host: String
    public let url: URL
    
    public init( username: String, host: String, url: URL ) {
        self.username = username
        self.host = host
        self.url = url
    }
    
}
