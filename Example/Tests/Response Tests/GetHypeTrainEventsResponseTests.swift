//
//  GetHypeTrainEventsResponseTests.swift
//  TwitchAPIWrapper_Tests
//
//  Created by Eric Vennaro on 8/3/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import TwitchAPIWrapper

class GetHypeTrainEventsResponseTests: XCTestCase {

    func testBuildModel_shouldSucceed() throws {
        let decoder = JSONDecoder.twitchAPIStandard()
        
        let wrapper = try decoder.decode(HypeTrainEventResponse.self, from: Fixtures.dataFromFixtureFile("HypeTrainEvents"))
        XCTAssertEqual(wrapper.hypeTrainEvents[0].id, "1b0AsbInCHZW2SQFQkCzqN07Ib2")
        XCTAssertEqual(wrapper.hypeTrainEvents[0].eventType, "hypetrain.progression")
        XCTAssertEqual(
            wrapper.hypeTrainEvents[0].eventTimestamp, ISO8601DateFormatter().date(from: "2020-04-24T20:07:24Z"))
        XCTAssertEqual(wrapper.hypeTrainEvents[0].version, "1.0")
        XCTAssertEqual(wrapper.hypeTrainEvents[0].eventData.broadcasterId, "270954519")
        XCTAssertEqual(
            wrapper.hypeTrainEvents[0].eventData.cooldownEndTime, ISO8601DateFormatter().date(from: "2020-04-24T20:07:24Z"))
        XCTAssertEqual(
            wrapper.hypeTrainEvents[0].eventData.expiresAt, ISO8601DateFormatter().date(from: "2020-04-24T20:07:24Z"))
        XCTAssertEqual(wrapper.hypeTrainEvents[0].eventData.goal, 1800)
        XCTAssertEqual(wrapper.hypeTrainEvents[0].eventData.id, "70f0c7d8-ff60-4c50-b138-f3a352833b50")
        XCTAssertEqual(wrapper.hypeTrainEvents[0].eventData.lastContribution.total, 200)
        XCTAssertEqual(wrapper.hypeTrainEvents[0].eventData.lastContribution.type, HypeTrainContributionType.bits)
        XCTAssertEqual(wrapper.hypeTrainEvents[0].eventData.lastContribution.user, "134247454")
        XCTAssertEqual(wrapper.hypeTrainEvents[0].eventData.level, 2)
        XCTAssertEqual(
            wrapper.hypeTrainEvents[0].eventData.startedAt, ISO8601DateFormatter().date(from: "2020-04-24T20:07:24Z"))
        XCTAssertEqual(wrapper.hypeTrainEvents[0].eventData.topContributions[0].total, 600)
        XCTAssertEqual(wrapper.hypeTrainEvents[0].eventData.topContributions[0].type, HypeTrainContributionType.bits)
        XCTAssertEqual(wrapper.hypeTrainEvents[0].eventData.topContributions[0].user, "134247450")
        XCTAssertEqual(wrapper.hypeTrainEvents[0].eventData.total, 600)
        XCTAssertEqual(wrapper.pagination.cursor, "ey")
        

        
        
    }
}
