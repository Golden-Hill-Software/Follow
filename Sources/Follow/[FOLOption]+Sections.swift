//
//  [FOLOption]+Sections.swift
//
//
//  Created by John Brayton on 2/5/24.
//

import Foundation

public extension [FOLOption] {
    
    func FOL_divideIntoSections() -> [[FOLOption]] {
        var result = [[FOLOption]]()
        var sectionResults = [FOLOption]()
        for option in self {
            switch option {
            case .action:
                sectionResults.append(option)
            case .separator:
                if !sectionResults.isEmpty {
                    result.append(sectionResults)
                    sectionResults = [FOLOption]()
                }
            }
        }
        if !sectionResults.isEmpty {
            result.append(sectionResults)
        }
        return result
    }
    
}
