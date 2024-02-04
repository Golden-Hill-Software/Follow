//
//  FOLFeedReaderUtilitiesUnitTests.swift
//
//
//  Created by John Brayton on 2/3/24.
//

import XCTest
@testable import Follow

class FOLFeedReaderUtilitiesUnitTests : XCTestCase {
    
    func testFeedReaderSorting() {
        let sortedFeedReaders = FOLFeedReaderUtilities.sortedFediverseClients
        for i in 1..<sortedFeedReaders.count {
            XCTAssert(sortedFeedReaders[i-1].name.localizedCaseInsensitiveCompare(sortedFeedReaders[i].name) == .orderedAscending)
        }
    }
    
}
