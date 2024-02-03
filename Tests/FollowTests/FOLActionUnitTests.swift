//
//  FOLActionUnitTests.swift
//  
//
//  Created by John Brayton on 2/2/24.
//

import XCTest
@testable import Follow

final class FOLActionUnitTests: XCTestCase {

    func testActionFromString() throws {
        XCTAssertEqual(FOLAction.fromString("copy:a:b:c"), .copy(string: "a:b:c"))
        XCTAssertEqual(FOLAction.fromString("open:https://www.goldenhillsoftware.com/"), .open(url: URL(string: "https://www.goldenhillsoftware.com/")!, applicationPath: nil))
    }

}
