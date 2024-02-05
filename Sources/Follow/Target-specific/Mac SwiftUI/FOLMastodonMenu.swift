//
//  FOLMastodonMenu.swift
//  SwiftUI App for macOS
//
//  Created by John Brayton on 2/4/24.
//

#if os(macOS)

import SwiftUI
import AppKit

public struct FOLHelpMenuItems {
    
    @CommandsBuilder
    public static func createFeedMenu( forProfile profile: FOLFeedProfile ) -> some Commands {
        let options = FOLFeedReaderUtilities.options(forFeedProfile: profile)
        createMenu(forOptions: options, title: String.localizedStringWithFormat("Blog"))
    }
    
    @CommandsBuilder
    public static func createFediverseMenu( forProfile profile: FOLFediverseProfile ) -> some Commands {
        let options = FOLFediverseClientUtilities.options(forFediverseProfile: profile)
        createMenu(forOptions: options, title: String.localizedStringWithFormat("Mastodon"))
    }
    
    static func createMenu( forOptions options: [FOLOption], title: String ) -> some Commands {
        CommandGroup(after: .help) {
            Menu(title) {
                ForEach(Array(options.enumerated()), id: \.offset) { (i, option) in
                    switch option {
                    case .separator:
                        Divider()
                    case .action(name: let name, action: let action, icon: let icon):
                        Button {
                            switch action {
                            case .copy( let string ):
                                NSPasteboard.general.clearContents()
                                NSPasteboard.general.setString(string, forType: .string)
                            case .open(let url):
                                NSWorkspace.shared.open(url)
                            }
                        } label: {
                            if let image = image(forOptionIcon: icon) {
                                Image(nsImage: image)
                                Text(name)
                            } else {
                                Text(name)
                            }
                        }
                    }
                }
            }
        }
    }
    
    static func image( forOptionIcon optionIcon: FOLOptionIcon ) -> NSImage? {
        switch optionIcon {
        case .applicationIcon(let applicationPath, _):
            if let applicationPath {
                return NSWorkspace.shared.icon(forFile: applicationPath)
            }
        default:
            break
        }
        return nil
    }
    
}

#endif
