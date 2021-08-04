//
//  CreateEventSubSubscriptionResponseTests.swift
//  TwitchAPIWrapper_Tests
//
//  Created by Eric Vennaro on 8/3/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import TwitchAPIWrapper

class CreateEventSubSubscriptionResponseTests: XCTestCase {

    func testBuildModel_shouldSucceed() throws {
        let decoder = JSONDecoder.twitchAPIStandard()
        
        let wrapper = try decoder.decode(EventSubscriptionResponse.self, from: Fixtures.dataFromFixtureFile("CreateEventSubSubscription"))
        XCTAssertEqual(wrapper.events[0].id, "26b1c993-bfcf-44d9-b876-379dacafe75a")
        XCTAssertEqual(wrapper.events[0].status, "webhook_callback_verification_pending")
        XCTAssertEqual(wrapper.events[0].type, "users.update")
        XCTAssertEqual(wrapper.events[0].version, "1")
        XCTAssertEqual(wrapper.events[0].condition, ["user_id": "1234"])
        XCTAssertEqual(wrapper.events[0].createdAt, ISO8601DateFormatter().date(from: "2020-11-10T20:29:44Z"))
        XCTAssertEqual(
            wrapper.events[0].transport,
            ["method": "webhook", "callback": "https://this-is-a-callback.com"])
        XCTAssertEqual(wrapper.events[0].cost, 1)
        XCTAssertEqual(wrapper.total, 1)
        XCTAssertEqual(wrapper.totalCost, 1)
        XCTAssertEqual(wrapper.maxTotalCost, 10000)
    }
}
