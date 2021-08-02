//
//  BitsLeaderboardResponseTests.swift
//  TwitchAPIWrapper_Tests
//
//  Created by Eric Vennaro on 8/1/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import TwitchAPIWrapper

class BitsLeaderboardResponseTests: XCTestCase {

    func testBuildModel_shouldSucceed() throws {
        let decoder = JSONDecoder.twitchAPIStandard()
        
        let wrapper = try decoder.decode(LeaderboardResponse.self, from: Fixtures.dataFromFixtureFile("BitsLeaderboard"))
        XCTAssertEqual(wrapper.total, 2)
        XCTAssertEqual(wrapper.dateRange.startedAt, ISO8601DateFormatter().date(from: "2018-02-05T08:00:00Z"))
        XCTAssertEqual(wrapper.dateRange.endedAt, ISO8601DateFormatter().date(from: "2018-02-12T08:00:00Z"))
        XCTAssertEqual(wrapper.entries[0].userId, "158010205")
        XCTAssertEqual(wrapper.entries[0].userLogin, "tundracowboy")
        XCTAssertEqual(wrapper.entries[0].userName, "TundraCowboy")
        XCTAssertEqual(wrapper.entries[0].rank, 1)
        XCTAssertEqual(wrapper.entries[0].score, 12543)
    }
}
