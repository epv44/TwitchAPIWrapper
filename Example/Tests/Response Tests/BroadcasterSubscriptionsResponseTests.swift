//
//  BroadcasterSubscriptionsResponseTests.swift
//  TwitchAPIWrapper_Tests
//
//  Created by Eric Vennaro on 6/9/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import TwitchAPIWrapper

class BroadcasterSubscriptionsResponseTests: XCTestCase {

    func testBuildModel_shouldSucceed() throws {
        let decoder = JSONDecoder.twitchAPIStandard()
        
        let wrapper = try decoder.decode(BroadcasterSubscriptionsResponse.self, from: Fixtures.dataFromFixtureFile("BroadcasterSubscriptions"))
        XCTAssertEqual(wrapper.pagination?.cursor, "xxxx")
        XCTAssertEqual(wrapper.total, 13)
        XCTAssertEqual(wrapper.broadcasterSubscriptions[0].broadcasterId, "141981764")
        XCTAssertEqual(wrapper.broadcasterSubscriptions[0].broadcasterLogin, "twitchdev")
        XCTAssertEqual(wrapper.broadcasterSubscriptions[0].broadcasterName, "TwitchDev")
        XCTAssertEqual(wrapper.broadcasterSubscriptions[0].gifterId, "12826")
        XCTAssertEqual(wrapper.broadcasterSubscriptions[0].gifterLogin, "twitch")
        XCTAssertEqual(wrapper.broadcasterSubscriptions[0].gifterName, "Twitch")
        XCTAssertEqual(wrapper.broadcasterSubscriptions[0].isGift, true)
        XCTAssertEqual(wrapper.broadcasterSubscriptions[0].tier, "1000")
        XCTAssertEqual(wrapper.broadcasterSubscriptions[0].planName, "Channel Subscription (twitchdev)")
        XCTAssertEqual(wrapper.broadcasterSubscriptions[0].userId, "527115020")
        XCTAssertEqual(wrapper.broadcasterSubscriptions[0].userName, "twitchgaming")
        XCTAssertEqual(wrapper.broadcasterSubscriptions[0].userLogin, "twitchgaming")
    }
}
