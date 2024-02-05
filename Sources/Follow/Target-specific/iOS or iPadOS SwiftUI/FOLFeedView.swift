//
//  FOLFeedView.swift
//  SwiftUI App for iOS
//
//  Created by John Brayton on 2/5/24.
//

#if os(iOS)

import SwiftUI

struct FOLFeedView : View {
    
    let title: String
    let feedProfile: FOLFeedProfile
    
    var body: some View {
        let options = FOLFeedReaderUtilities.options(forFeedProfile: self.feedProfile)
        FOLOptionsView(title: self.title, options: options)
    }
    
}

#endif
