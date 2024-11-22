//
//  FOLIceCubes.swift
//
//
//  Created by John Brayton on 2/2/24.
//

import Foundation

struct FOLIceCubes : FOLFediverseClient {
    
    let name = String.localizedStringWithFormat("Ice Cubes")
    
    let appleAppId = 6444915884
    
    func localURL(forFediverseProfile fediverseProfile: FOLFediverseProfile) -> URL? {
        guard var urlComponents = URLComponents(url: fediverseProfile.url, resolvingAgainstBaseURL: false) else {
            return nil
        }
        urlComponents.scheme = "icecubesapp"
        return urlComponents.url
    }
    
}
