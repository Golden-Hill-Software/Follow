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
    
    func testWebURL() {
        let fediverseProfile = FOLFediverseProfile(username: "unread", host: "mastodon.goldenhillsoftware.com")
        XCTAssertEqual(FOLFediverseClientUtilities.webURL(forFediverseProfile: fediverseProfile).absoluteString, "https://mastodon.goldenhillsoftware.com/@unread")
    }
    
    func testHandle() {
        let fediverseProfile = FOLFediverseProfile(username: "unread", host: "mastodon.goldenhillsoftware.com")
        XCTAssertEqual(FOLFediverseClientUtilities.handle(forFediverseProfile: fediverseProfile), "@unread@mastodon.goldenhillsoftware.com")
    }
    
}
