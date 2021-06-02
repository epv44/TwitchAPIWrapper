//
//  UserExtensionsResponseTests.swift
//  TwitchAPIWrapper_Tests
//
//  Created by Eric Vennaro on 6/1/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import TwitchAPIWrapper

class UserExtensionsResponseTests: XCTestCase {

    func testBuildModel_shouldSucceed() throws {
        let decoder = JSONDecoder.twitchAPIStandard()
        
        let wrapper = try decoder.decode(UserExtensionResponse.self, from: Fixtures.dataFromFixtureFile("UserExtensions"))
        let extensions = wrapper.extensions
        
        XCTAssertEqual(extensions[0].id, "wi08ebtatdc7oj83wtl9uxwz807l8b")
        XCTAssertEqual(extensions[0].version, "1.1.8")
        XCTAssertEqual(extensions[0].name, "Streamlabs Leaderboard")
        XCTAssertEqual(extensions[0].canActivate, true)
        XCTAssertEqual(extensions[0].type, [ExtensionType.panel])
        
        XCTAssertEqual(extensions[1].id, "d4uvtfdr04uq6raoenvj7m86gdk16v")
        XCTAssertEqual(extensions[1].version, "2.0.2")
        XCTAssertEqual(extensions[1].name, "Prime Subscription and Loot Reminder")
        XCTAssertEqual(extensions[1].canActivate, true)
        XCTAssertEqual(extensions[1].type, [ExtensionType.overlay])
        
        XCTAssertEqual(extensions[2].id, "rh6jq1q334hqc2rr1qlzqbvwlfl3x0")
        XCTAssertEqual(extensions[2].version, "1.1.0")
        XCTAssertEqual(extensions[2].name, "TopClip")
        XCTAssertEqual(extensions[2].canActivate, true)
        XCTAssertEqual(extensions[2].type, [ExtensionType.mobile, ExtensionType.panel])
        
        XCTAssertEqual(extensions[3].id, "zfh2irvx2jb4s60f02jq0ajm8vwgka")
        XCTAssertEqual(extensions[3].version, "1.0.19")
        XCTAssertEqual(extensions[3].name, "Streamlabs")
        XCTAssertEqual(extensions[3].canActivate, true)
        XCTAssertEqual(extensions[3].type, [ExtensionType.mobile, ExtensionType.overlay])
        
        XCTAssertEqual(extensions[4].id, "lqnf3zxk0rv0g7gq92mtmnirjz2cjj")
        XCTAssertEqual(extensions[4].version, "0.0.1")
        XCTAssertEqual(extensions[4].name, "Dev Experience Test")
        XCTAssertEqual(extensions[4].canActivate, true)
        XCTAssertEqual(extensions[4].type, [ExtensionType.component, ExtensionType.mobile, ExtensionType.panel, ExtensionType.overlay])
    }
}
