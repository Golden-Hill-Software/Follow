//
//  FOLOptionIcon.swift
//
//
//  Created by John Brayton on 2/4/24.
//

import Foundation
#if canImport(UIKit)
import UIKit
#endif

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
    
    #if canImport(UIKit)
    public var image: UIImage {
        switch self {
        case .web:
            return getSymbol(named: "safari")
        case .copy:
            return getSymbol(named: "doc.on.doc")
        case .applicationIcon(_, let bundleIconName):
            return  UIImage(named: bundleIconName, in: Bundle.module, with: nil)!
        }
    }
    
    private func getSymbol( named: String ) -> UIImage {
        let size: CGFloat = 32.0
        let configuration = UIImage.SymbolConfiguration(pointSize: size)
        let loadedImage = UIImage(systemName: named, withConfiguration: configuration)!
        let image = UIGraphicsImageRenderer(size: CGSize(width: size, height: size)).image { _ in
            loadedImage.draw(in: CGRect(origin: .zero, size: CGSize(width: size, height: size)))
        }
        return image.withRenderingMode(.alwaysTemplate)
    }
    #endif
}
