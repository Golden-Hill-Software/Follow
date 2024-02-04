//
//  FOLFeedReader.swift
//
//
//  Created by John Brayton on 2/3/24.
//

import Foundation

protocol FOLFeedReader : FOLApp {
    
    func localURL( forFeedProfile feedProfile: FOLFeedProfile ) -> URL?
        
}
