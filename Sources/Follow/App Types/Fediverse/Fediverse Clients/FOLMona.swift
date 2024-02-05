//
//  FOLMona.swift
//
//
//  Created by John Brayton on 2/2/24.
//

import Foundation

struct FOLMona : FOLFediverseClient {

    let name = String.localizedStringWithFormat("Mona")
    
    let appleAppId = 1659154653
    
    func localURL(forFediverseProfile fediverseProfile: FOLFediverseProfile) -> URL? {
        let string = String(format: "mona://%@/@%@", fediverseProfile.host, fediverseProfile.username)
        return URL(string: string)
    }
    
}
