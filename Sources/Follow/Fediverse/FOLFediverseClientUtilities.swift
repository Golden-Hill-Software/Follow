//
//  FOLFediverseClientUtilities.swift
//
//
//  Created by John Brayton on 2/2/24.
//

import Foundation

struct FOLFediverseClientUtilities {
    
    static let sortedFediverseClients: [FOLFediverseClient] = [
        FOLIceCubes(),
        FOLIvory(),
        FOLMona(),
    ]
    
    static func webURL( forFediverseProfile fediverseProfile: FOLFediverseProfile ) -> URL {
        let string = String.localizedStringWithFormat("https://%@/@%@", fediverseProfile.host, fediverseProfile.username)
        return URL(string: string)!
    }
    
    static func handle( forFediverseProfile fediverseProfile: FOLFediverseProfile ) -> String {
        return String.localizedStringWithFormat("@%@@%@", fediverseProfile.username, fediverseProfile.host)
    }
    
    static func options( forFediverseProfile fediverseProfile: FOLFediverseProfile ) -> [FOLOption] {
        var result = [FOLOption]()
        
        let webURL = webURL(forFediverseProfile: fediverseProfile)
        let handle = handle(forFediverseProfile: fediverseProfile)
        
        result.append(FOLOption.action(name: String.localizedStringWithFormat("View on Web"), action: .open(url: webURL, applicationPath: nil)))
        result.append(.separator)
        
        var installedClientOptions = [FOLOption]()
        for client in sortedFediverseClients {
            if let url = client.localURL(forFediverseProfile: fediverseProfile) {
                switch url.FOL_canOpen {
                case .canOpen( let applicationPath ):
                    let action = FOLAction.open(url: url, applicationPath: applicationPath)
                    let option = FOLOption.action(name: String.localizedStringWithFormat("Open in %@", client.name), action: action)
                    installedClientOptions.append(option)
                case .cannotOpen:
                    break
                }
            }
        }
        if !installedClientOptions.isEmpty {
            result.append(contentsOf: installedClientOptions)
            result.append(.separator)
        }
        
        result.append(FOLOption.action(name: String.localizedStringWithFormat("Copy Link"), action: .copy(string: webURL.absoluteString)))
        result.append(FOLOption.action(name: String.localizedStringWithFormat("Copy Handle"), action: .copy(string: handle)))

        return result
    }
    
}
