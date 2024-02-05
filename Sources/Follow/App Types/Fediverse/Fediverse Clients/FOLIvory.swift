//
//  FOLIvory.swift
//
//
//  Created by John Brayton on 2/2/24.
//

import Foundation

struct FOLIvory : FOLFediverseClient {

    let name = String.localizedStringWithFormat("Ivory")
    
    let appleAppId: Int = 6444602274
    
    func localURL(forFediverseProfile fediverseProfile: FOLFediverseProfile) -> URL? {
        let string = String(format: "ivory://acct/openURL?url=https://%@/@%@", fediverseProfile.host, fediverseProfile.username)
        return URL(string: string)
    }
    
}
