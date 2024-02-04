//
//  FOLReeder.swift
//
//
//  Created by John Brayton on 2/3/24.
//

import Foundation

struct FOLReeder : FOLFeedReader {
    
    let name = String.localizedStringWithFormat("Reeder")

    func localURL(forFeedProfile feedProfile: FOLFeedProfile) -> URL? {
        guard var urlComponents = URLComponents(url: feedProfile.feedURL, resolvingAgainstBaseURL: false) else {
            return nil
        }
        urlComponents.scheme = "reeder"
        return urlComponents.url
    }
    
}
