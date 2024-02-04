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
    
    // Ensure that Apple App IDs are unique. (This does not ensure they are correct, but
    // could help prevent some mistakes.)
    func testUniqueAppIds() {
        let sortedFeedReaders = FOLFeedReaderUtilities.sortedFediverseClients
        var appleAppIds = Set<Int>()
        for i in 0..<sortedFeedReaders.count {
            XCTAssert(!appleAppIds.contains(sortedFeedReaders[i].appleAppId))
            appleAppIds.insert(sortedFeedReaders[i].appleAppId)
        }
    }
    
}
