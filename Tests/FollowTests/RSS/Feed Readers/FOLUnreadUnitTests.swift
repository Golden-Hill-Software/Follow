//
//  FOLUnreadUnitTests.swift
//  
//
//  Created by John Brayton on 2/3/24.
//

import XCTest
@testable import Follow

final class FOLUnreadUnitTests: XCTestCase {

    func testLocalURL() throws {
        let app = FOLUnread()
        let feedProfile = FOLFeedProfile(feedURL: URL(string: "http://www.goldenhillsoftware.com/unread/feed/")!, websiteURL: URL(string: "https://www.goldenhillsoftware.com/")!)
        XCTAssertEqual(app.localURL(forFeedProfile: feedProfile)?.absoluteString, "unread:///feeds?url=http://www.goldenhillsoftware.com/unread/feed/")
    }

}
