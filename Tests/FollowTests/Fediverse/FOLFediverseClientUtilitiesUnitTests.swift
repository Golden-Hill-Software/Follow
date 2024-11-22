//
//  FOLFediverseClientUtilitiesUnitTests.swift
//
//
//  Created by John Brayton on 2/2/24.
//

import XCTest
@testable import Follow

final class FOLFediverseClientUtilitiesUnitTests: XCTestCase {

    /*
        I do not want to perform the sorting in-memory. Having the list sorted already
        is slightly faster. The purpose of this unit test is to ensure that the list of
        fediverse clients is sorted correctly.
     */
    func testClientSorting() {
        let sortedFediverseClients = FOLFediverseClientUtilities.sortedFediverseClients
        for i in 1..<sortedFediverseClients.count {
            XCTAssert(sortedFediverseClients[i-1].name.localizedCaseInsensitiveCompare(sortedFediverseClients[i].name) == .orderedAscending)
        }
    }
    
    
    // Ensure that Apple App IDs are unique. (This does not ensure they are correct, but
    // could help prevent some mistakes.)
    func testUniqueAppIds() {
        let sortedFediverseClients = FOLFediverseClientUtilities.sortedFediverseClients
        var appleAppIds = Set<Int>()
        for i in 0..<sortedFediverseClients.count {
            XCTAssert(!appleAppIds.contains(sortedFediverseClients[i].appleAppId))
            appleAppIds.insert(sortedFediverseClients[i].appleAppId)
        }
    }

    func testWebURL() {
        let fediverseProfile = FOLFediverseProfile(username: "unread", host: "goldenhillsoftware.com", url: URL(string: "https://social.goldenhillsoftware.com/@unread")!)
        XCTAssertEqual(FOLFediverseClientUtilities.webURL(forFediverseProfile: fediverseProfile).absoluteString, "https://social.goldenhillsoftware.com/@unread")
    }
    
    func testHandle() {
        let fediverseProfile = FOLFediverseProfile(username: "unread", host: "goldenhillsoftware.com", url: URL(string: "https://social.goldenhillsoftware.com/@unread")!)
        XCTAssertEqual(FOLFediverseClientUtilities.handle(forFediverseProfile: fediverseProfile), "@unread@goldenhillsoftware.com")
    }
    
}
