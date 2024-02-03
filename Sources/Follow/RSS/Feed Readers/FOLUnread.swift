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
        guard var urlComponents = URLComponents(url: feedProfile.feedURL, resolvingAgainstBaseURL: false) else {
            return nil
        }
        let scheme = urlComponents.scheme?.lowercased()
        if scheme == "https" {
            urlComponents.scheme = "unread-feed-https"
        } else if scheme == "http" {
            urlComponents.scheme = "unread-feed-http"
        }
        return urlComponents.url
    }

    
}
