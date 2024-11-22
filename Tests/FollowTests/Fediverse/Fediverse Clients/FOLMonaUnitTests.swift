//
//  FOLMonaUnitTests.swift
//  
//
//  Created by John Brayton on 2/2/24.
//

import XCTest
@testable import Follow

final class FOLMonaUnitTests: XCTestCase {

    func testLocalURL() throws {
        let fediverseProfile = FOLFediverseProfile(username: "unread", host: "goldenhillsoftware.com", url: URL(string: "https://social.goldenhillsoftware.com/@unread")!)
        let app = FOLMona()
        XCTAssertEqual(app.localURL(forFediverseProfile: fediverseProfile)?.absoluteString, "mona://goldenhillsoftware.com/@unread")
    }

}
