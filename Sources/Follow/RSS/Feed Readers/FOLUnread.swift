//
//  FOLUnread.swift
//
//
//  Created by John Brayton on 2/3/24.
//

import Foundation

struct FOLUnread : FOLFeedReader {

    let name = String.localizedStringWithFormat("Unread")

    func localURL(forFeedProfile feedProfile: FOLFeedProfile) -> URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "unread"
        urlComponents.host = ""
        urlComponents.path = "/feeds"
        urlComponents.queryItems = [URLQueryItem(name: "url", value: feedProfile.feedURL.absoluteString)]
        return urlComponents.url
    }

    
}
