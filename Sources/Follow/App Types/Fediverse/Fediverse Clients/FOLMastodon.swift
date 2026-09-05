//
//  FOLMastodon.swift
//
//
//  Created by John Brayton on 2/2/24.
//

import Foundation

struct FOLMastodon : FOLFediverseClient {

    let name = String.localizedStringWithFormat("Mastodon")
    
    let appleAppId = 1571998974
    
    func localURL(forFediverseProfile fediverseProfile: FOLFediverseProfile) -> URL? {
        let string = String(format: "mastodon://profile/%@@%@", fediverseProfile.username, fediverseProfile.host)
        return URL(string: string)
    }
    
}
