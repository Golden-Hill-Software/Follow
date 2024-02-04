//
//  FOLFieryFeeds.swift
//
//
//  Created by John Brayton on 2/3/24.
//

import Foundation

struct FOLFieryFeeds : FOLFeedReader {

    let name = String.localizedStringWithFormat("Fiery Feeds")
    
    func localURL(forFeedProfile feedProfile: FOLFeedProfile) -> URL? {
        let string = String(format: "fiery://subscribe/%@", feedProfile.feedURL.absoluteString)
        return URL(string: string)
    }
    
    
    
    
}
