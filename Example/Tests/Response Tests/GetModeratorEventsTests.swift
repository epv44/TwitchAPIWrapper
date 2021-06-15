//
//  GetModeratorEventsTests.swift
//  TwitchAPIWrapper_Tests
//
//  Created by Eric Vennaro on 6/14/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import TwitchAPIWrapper

class GetModeratorEventsTests: XCTestCase {

    func testBuildModel_shouldSucceed() throws {
        let decoder = JSONDecoder.twitchAPIStandard()
        
        let wrapper = try decoder.decode(ModeratorEventsResponse.self, from: Fixtures.dataFromFixtureFile("ModeratorEvents"))
        XCTAssertEqual(wrapper.pagination.cursor, "xxx")
        XCTAssertEqual(wrapper.moderatorEvents[0].id, "1IVBTnDSUDApiBQW4UBcVTK4hPr")
        XCTAssertEqual(wrapper.moderatorEvents[0].eventType, "moderation.moderator.remove")
        XCTAssertEqual(wrapper.moderatorEvents[0].eventTimestamp, ISO8601DateFormatter().date(from: "2019-03-15T18:18:14Z"))
        XCTAssertEqual(wrapper.moderatorEvents[0].version, "1.0")
        XCTAssertEqual(wrapper.moderatorEvents[0].eventData.broadcasterId, "198704263")
        XCTAssertEqual(wrapper.moderatorEvents[0].eventData.broadcasterLogin, "aan22209")
        XCTAssertEqual(wrapper.moderatorEvents[0].eventData.broadcasterName, "aan22209")
        XCTAssertEqual(wrapper.moderatorEvents[0].eventData.userId, "423374343")
        XCTAssertEqual(wrapper.moderatorEvents[0].eventData.userLogin, "glowillig")
        XCTAssertEqual(wrapper.moderatorEvents[0].eventData.userName, "glowillig")
    }
}
