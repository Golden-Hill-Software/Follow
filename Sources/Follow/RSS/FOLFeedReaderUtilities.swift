//
//  FOLFeedReaderUtilities.swift
//
//
//  Created by John Brayton on 2/3/24.
//

import Foundation

struct FOLFeedReaderUtilities {
    
    static let sortedFediverseClients: [FOLFeedReader] = [
        FOLFieryFeeds(),
        FOLNetNewsWire(),
        FOLReeder(),
        FOLUnread(),
    ]
    
    static func options( forFeedProfile feedProfile: FOLFeedProfile ) -> [FOLOption] {
        var result = [FOLOption]()
        
        result.append(FOLOption.action(name: String.localizedStringWithFormat("View on Web"), action: .open(url: feedProfile.websiteURL, applicationPath: nil)))
        result.append(.separator)
        
        var installedClientOptions = [FOLOption]()
        for client in sortedFediverseClients {
            if let url = client.localURL(forFeedProfile: feedProfile) {
                switch url.FOL_canOpen {
                case .canOpen( let applicationPath ):
                    let action = FOLAction.open(url: url, applicationPath: applicationPath)
                    let option = FOLOption.action(name: String.localizedStringWithFormat("Subscribe in %@", client.name), action: action)
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
        
        result.append(FOLOption.action(name: String.localizedStringWithFormat("Copy Website Link"), action: .copy(string: feedProfile.websiteURL.absoluteString)))
        result.append(FOLOption.action(name: String.localizedStringWithFormat("Copy Feed Link"), action: .copy(string: feedProfile.feedURL.absoluteString)))
        
        return result
    }
    
}
