//
//  FOLOptionsView.swift
//  SwiftUI App for iOS
//
//  Created by John Brayton on 2/5/24.
//

#if os(iOS)

import SwiftUI
import UIKit

/*
    FOLFeedView and FOLFediverseView display their options in an FOLOptionsView.
 */
struct FOLOptionsView : View {
    
    let title: String
    let options: [FOLOption]

    var body : some View {
        let sections = self.options.FOL_divideIntoSections()
        List {
            ForEach(Array(sections.enumerated()), id: \.offset) { (i, section) in
                Section {
                    ForEach(Array(section.enumerated()), id: \.offset) { (i, option) in
                        switch option {
                        case .action(let name, let action, let icon):
                            Button {
                                switch action {
                                case .copy(let string):
                                    UIPasteboard.general.string = string
                                case .open(url: let url):
                                    UIApplication.shared.open(url)
                                }
                            } label: {
                                HStack {
                                    Image(uiImage: icon.image)
                                    Text(name)
                                        .foregroundColor(Color.init(uiColor: UIColor.label))
                                }
                            }
                            //.buttonStyle(ButtonStyle.)
                            .frame(minHeight: 44.0)
                        case .separator:
                            fatalError()
                        }
                    }
                }
            }
        }
        .listStyle(.grouped)
        .navigationTitle(self.title)
    }
}

#endif
