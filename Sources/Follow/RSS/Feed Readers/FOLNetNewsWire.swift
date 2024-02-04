//
//  FOLNetNewsWire.swift
//
//
//  Created by John Brayton on 2/3/24.
//

import Foundation

struct FOLNetNewsWire : FOLFeedReader {
    
    let name = String.localizedStringWithFormat("NetNewsWire")

    func localURL(forFeedProfile feedProfile: FOLFeedProfile) -> URL? {
        guard var urlComponents = URLComponents(url: feedProfile.feedURL, resolvingAgainstBaseURL: false) else {
            return nil
        }
        urlComponents.scheme = "x-netnewswire-feed"
        return urlComponents.url
    }
    
}
