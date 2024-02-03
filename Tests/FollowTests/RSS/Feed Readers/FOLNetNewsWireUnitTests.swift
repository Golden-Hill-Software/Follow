//
//  FOLNetNewsWireUnitTests.swift
//  
//
//  Created by John Brayton on 2/3/24.
//

import XCTest
@testable import Follow

final class FOLNetNewsWireUnitTests: XCTestCase {
    
    func testLocalURL() throws {
        var feedProfile = FOLFeedProfile(feedURL: URL(string: "https://www.goldenhillsoftware.com/feed/")!, websiteURL: URL(string: "https://www.goldenhillsoftware.com/")!)
        let app = FOLNetNewsWire()
        XCTAssertEqual(app.localURL(forFeedProfile: feedProfile)?.absoluteString, "x-netnewswire-feed://www.goldenhillsoftware.com/feed/")
        feedProfile = FOLFeedProfile(feedURL: URL(string: "http://www.goldenhillsoftware.com/unread/feed/")!, websiteURL: URL(string: "https://www.goldenhillsoftware.com/")!)
        XCTAssertEqual(app.localURL(forFeedProfile: feedProfile)?.absoluteString, "x-netnewswire-feed://www.goldenhillsoftware.com/unread/feed/")
    }
}
