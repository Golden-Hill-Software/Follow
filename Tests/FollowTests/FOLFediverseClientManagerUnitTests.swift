//
//  FOLFediverseClientManagerUnitTests.swift
//  
//
//  Created by John Brayton on 2/2/24.
//

import XCTest
@testable import Follow

final class FOLFediverseClientManagerUnitTests: XCTestCase {

    /*
        I do not want to perform the sorting in-memory. Having the list sorted already
        is slightly faster. The purpose of this unit test is to ensure that the list of
        fediverse clients is sorted correctly.
     */
    func testClientSorting() {
        let fediverseClientManager = FOLFediverseClientManager()
        let sortedFediverseClients = fediverseClientManager.sortedFediverseClients
        for i in 1..<sortedFediverseClients.count {
            XCTAssert(sortedFediverseClients[i-1].name.localizedCaseInsensitiveCompare(sortedFediverseClients[i].name) == .orderedAscending)
        }
    }
    
}
