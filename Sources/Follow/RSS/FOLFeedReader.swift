//
//  FOLFeedReader.swift
//
//
//  Created by John Brayton on 2/3/24.
//

import Foundation

protocol FOLFeedReader {
    
    var name: String { get }
    
    func localURL( forFeedProfile feedProfile: FOLFeedProfile ) -> URL?
        
}
