//
//  FOLMona.swift
//
//
//  Created by John Brayton on 2/2/24.
//

import Foundation

struct FOLMona : FOLFediverseClient {

    let name = String.localizedStringWithFormat("Mona")
    
    func localURL(forFediverseProfile fediverseProfile: FOLFediverseProfile) -> URL? {
        let string = String(format: "mona://%@/@%@", fediverseProfile.host, fediverseProfile.username)
        return URL(string: string)
    }
    
}
