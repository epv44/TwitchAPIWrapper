//
//  GetModeratorsResponseTests.swift
//  TwitchAPIWrapper_Tests
//
//  Created by Eric Vennaro on 6/14/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import TwitchAPIWrapper

class GetModeratorsResponseTests: XCTestCase {

    func testBuildModel_shouldSucceed() throws {
        let decoder = JSONDecoder.twitchAPIStandard()
        
        let wrapper = try decoder.decode(ModeratorResponse.self, from: Fixtures.dataFromFixtureFile("Moderators"))
        XCTAssertEqual(wrapper.pagination.cursor, "xxx")
        XCTAssertEqual(wrapper.moderators[0].userId, "424596340")
        XCTAssertEqual(wrapper.moderators[0].userLogin, "quotrok")
        XCTAssertEqual(wrapper.moderators[0].userName, "quotrok")
    }
}
