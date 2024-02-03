//
//  FOLFeedProfile.swift
//  
//
//  Created by John Brayton on 2/3/24.
//

import Foundation

public struct FOLFeedProfile {
    
    public let feedURL: URL
    public let websiteURL: URL
    
    public init( feedURL: URL, websiteURL: URL ) {
        for url in [feedURL, websiteURL] {
            if !["http","https"].contains(url.scheme) {
                fatalError("The feed URL must have a scheme of \"http\" or \"https\".")
            }
        }
        self.feedURL = feedURL
        self.websiteURL = websiteURL
    }
    
}
