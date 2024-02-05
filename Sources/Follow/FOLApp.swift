//
//  FOLApp.swift
//
//
//  Created by John Brayton on 2/4/24.
//

import Foundation

public protocol FOLApp {
    
    var name: String { get }
    
    // The app does not directly use this, but I want to keep a record of these so that I can
    // update icons via the iTunes API. This is only necessary on iOS, so I can make this optional
    // if I add a Mac-only app.
    var appleAppId: Int { get }
    
}
