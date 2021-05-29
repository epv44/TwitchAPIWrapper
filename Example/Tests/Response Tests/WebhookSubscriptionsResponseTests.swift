//
//  WebhookSubscriptionsResponseTests.swift
//  TwitchAPIWrapper_Tests
//
//  Created by Eric Vennaro on 5/28/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import TwitchAPIWrapper

class WebhookSubscriptionsResponseTest: XCTestCase {

    func testBuildModelFromDecoder() throws {
        let decoder = JSONDecoder.twitchAPIStandard()
        
        let wrapper = try! decoder.decode(WebhookSubscriptionResponse.self, from: Fixtures.dataFromFixtureFile("WebhookSubscription"))
        XCTAssertEqual(wrapper.total, 12)
        XCTAssertEqual(wrapper.subscriptions[0].topic, "https://api.twitch.tv/helix/streams?user_id=123")
        XCTAssertEqual(wrapper.subscriptions[0].callback, "http://example.com/your_callback")
        XCTAssertEqual(wrapper.subscriptions[0].expiresAt, ISO8601DateFormatter().date(from: "2018-07-30T20:00:00Z"))
        XCTAssertEqual(wrapper.subscriptions[1].topic, "https://api.twitch.tv/helix/streams?user_id=345")
        XCTAssertEqual(wrapper.subscriptions[1].callback, "http://example.com/your_callback")
        XCTAssertEqual(wrapper.subscriptions[1].expiresAt, ISO8601DateFormatter().date(from: "2018-07-30T20:03:00Z"))
        XCTAssertEqual(wrapper.pagination?.cursor, "eyJiIjpudWxsLCJhIjp7IkN1cnNvciI6IkFYc2laU0k2TVN3aWFTSTZNWDAifX0")
    }
}
