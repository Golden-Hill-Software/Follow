//
//  FOLIndigo.swift
//  Follow
//
//  Created by John Brayton on 9/4/26.
//

import Foundation

struct FOLIndigo : FOLFediverseClient {
    
    let name = String.localizedStringWithFormat("Indigo")
    
    let appleAppId = 6763755310
    
    func localURL(forFediverseProfile fediverseProfile: FOLFediverseProfile) -> URL? {
        let string = String(format: "indigoapp://open-url?url=%@", fediverseProfile.url.absoluteString)
        return URL(string: string)
    }

}
