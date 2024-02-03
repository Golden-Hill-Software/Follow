//
//  FOLIceCubes.swift
//
//
//  Created by John Brayton on 2/2/24.
//

import Foundation

struct FOLIceCubes : FOLFediverseClient {
    
    let name = String.localizedStringWithFormat("Ice Cubes")
    
    func localURL(forFediverseProfile fediverseProfile: FOLFediverseProfile) -> URL? {
        let string = String(format: "icecubesapp://%@/@%@", fediverseProfile.host, fediverseProfile.username)
        return URL(string: string)
    }
    
    
    
    
}
