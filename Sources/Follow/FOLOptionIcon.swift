//
//  FOLOptionIcon.swift
//
//
//  Created by John Brayton on 2/4/24.
//

import Foundation

public enum FOLOptionIcon {
    
    // Indicates that the option is to open a webpage.
    case web

    // Indicates that the option is to copy a link, handle, or other bit of text to the pasteboard.
    case copy
    
    // Indicates that the option is to open a specific application. The application path will always
    // be nil on iOS. On macOS it can be used to get the icon for the application. The bundleIconName
    // will always point to an icon (pre-downloaded and cropped via the iTunes API) for the application.
    // The icons are in Media.assets.
    case applicationIcon(applicationPath: String?, bundleIconName: String)
    
}
