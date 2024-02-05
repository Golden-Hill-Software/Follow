//
//  FOLFediverseView.swift
//  SwiftUI App for iOS
//
//  Created by John Brayton on 2/5/24.
//

#if os(iOS)

import SwiftUI

public struct FOLFediverseView : View {
    
    let title: String
    let fediverseProfile: FOLFediverseProfile
    
    public init( title: String, fediverseProfile: FOLFediverseProfile ) {
        self.title = title
        self.fediverseProfile = fediverseProfile
    }
    
    public var body: some View {
        let options = FOLFediverseClientUtilities.options(forFediverseProfile: self.fediverseProfile)
        FOLOptionsView(title: self.title, options: options)
    }
    
}

#endif
