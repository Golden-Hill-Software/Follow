//
//  FOLFediverseView.swift
//  SwiftUI App for iOS
//
//  Created by John Brayton on 2/5/24.
//

#if os(iOS)

import SwiftUI

struct FOLFediverseView : View {
    
    let title: String
    let fediverseProfile: FOLFediverseProfile
    
    var body: some View {
        let options = FOLFediverseClientUtilities.options(forFediverseProfile: self.fediverseProfile)
        FOLOptionsView(title: self.title, options: options)
    }
    
}

#endif
