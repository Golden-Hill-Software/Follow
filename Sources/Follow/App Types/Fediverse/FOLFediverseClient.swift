//
//  FOLFediverseClient.swift
//
//
//  Created by John Brayton on 2/2/24.
//

import Foundation

public protocol FOLFediverseClient : FOLApp {
    
    func localURL( forFediverseProfile fediverseProfile: FOLFediverseProfile ) -> URL?
    
}
