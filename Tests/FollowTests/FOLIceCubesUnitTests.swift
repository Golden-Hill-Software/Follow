//
//  FOLIceCubesUnitTests.swift
//  
//
//  Created by John Brayton on 2/2/24.
//

import XCTest
@testable import Follow

final class FOLIceCubesUnitTests: XCTestCase {

    func testLocalURL() throws {
        let fediverseProfile = FOLFediverseProfile(username: "unread", host: "mastodon.goldenhillsoftware.com")
        let app = FOLIceCubes()
        XCTAssertEqual(app.localURL(forFediverseProfile: fediverseProfile)?.absoluteString, "icecubesapp://mastodon.goldenhillsoftware.com/@unread")
    }

}
