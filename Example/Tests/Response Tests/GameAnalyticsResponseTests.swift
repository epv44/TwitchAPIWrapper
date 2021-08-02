//
//  GameAnalyticsResponseTests.swift
//  TwitchAPIWrapper_Tests
//
//  Created by Eric Vennaro on 8/1/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import TwitchAPIWrapper

class GameAnalyticsResponseTests: XCTestCase {

    func testBuildModel_shouldSucceed() throws {
        let decoder = JSONDecoder.twitchAPIStandard()
        
        let wrapper = try decoder.decode(GameAnalyticsResponse.self, from: Fixtures.dataFromFixtureFile("GameAnalytics"))
        XCTAssertEqual(wrapper.gameAnalytics[0].type, "overview_v2")
        XCTAssertEqual(wrapper.gameAnalytics[0].url, URL(string:"https://twitch-piper-reports.s3-us-west-2.amazonaws.com/games/66170/overview/1518307200000.csv"))
        XCTAssertEqual(wrapper.gameAnalytics[0].dateRange.startedAt, ISO8601DateFormatter().date(from: "2018-01-01T00:00:00Z"))
        XCTAssertEqual(wrapper.gameAnalytics[0].dateRange.endedAt, ISO8601DateFormatter().date(from: "2018-03-01T00:00:00Z"))
        XCTAssertEqual(wrapper.gameAnalytics[0].gameId, "493057")
    }
}
