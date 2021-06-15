//
//  BannedEventsResponseTests.swift
//  TwitchAPIWrapper_Tests
//
//  Created by Eric Vennaro on 6/14/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import TwitchAPIWrapper

class BannedEventsResponseTests: XCTestCase {

    func testBuildModel_shouldSucceed() throws {
        let decoder = JSONDecoder.twitchAPIStandard()
        
        let wrapper = try decoder.decode(BannedEventsResponse.self, from: Fixtures.dataFromFixtureFile("BannedEvents"))
        XCTAssertEqual(wrapper.pagination.cursor, "eee")
        XCTAssertEqual(wrapper.bannedEvents[0].id, "1IPFqAb0p0JncbPSTEPhx8JF1Sa")
        XCTAssertEqual(wrapper.bannedEvents[0].eventType, "moderation.user.ban")
        XCTAssertEqual(wrapper.bannedEvents[0].eventTimestamp, ISO8601DateFormatter().date(from: "2019-03-13T15:55:14Z"))
        XCTAssertEqual(wrapper.bannedEvents[0].version, "1.0")
        XCTAssertEqual(wrapper.bannedEvents[0].eventData.broadcasterId, "198704263")
        XCTAssertEqual(wrapper.bannedEvents[0].eventData.broadcasterName, "racageneg")
        XCTAssertEqual(wrapper.bannedEvents[0].eventData.broadcasterLogin, "racageneg")
        XCTAssertEqual(wrapper.bannedEvents[0].eventData.userId, "424596340")
        XCTAssertEqual(wrapper.bannedEvents[0].eventData.userLogin, "quotrok")
        XCTAssertEqual(wrapper.bannedEvents[0].eventData.userName, "quotrok")
        XCTAssertEqual(wrapper.bannedEvents[0].eventData.expiresAt, "")
    }
}
