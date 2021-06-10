//
//  UserSubscriptionResponseTests.swift
//  TwitchAPIWrapper_Tests
//
//  Created by Eric Vennaro on 6/9/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import TwitchAPIWrapper

class UserSubscriptionResponseTests: XCTestCase {

    func testBuildSuccessModel_shouldSucceed() throws {
        let decoder = JSONDecoder.twitchAPIStandard()
        
        let wrapper = try decoder.decode(UserSubscriptionResponse.self, from: Fixtures.dataFromFixtureFile("UserSubscription"))
        XCTAssertEqual(wrapper.subscribed?[0].broadcasterId, "149747285")
        XCTAssertEqual(wrapper.subscribed?[0].broadcasterName, "TwitchPresents")
        XCTAssertEqual(wrapper.subscribed?[0].broadcasterLogin, "twitchpresents")
        XCTAssertEqual(wrapper.subscribed?[0].isGift, false)
        XCTAssertEqual(wrapper.subscribed?[0].tier, "1000")
        
        XCTAssertNil(wrapper.error)
        XCTAssertNil(wrapper.errorMessage)
        XCTAssertNil(wrapper.status)
    }
    
    func testBuildErrorModel_shouldSucceed() throws {
        let decoder = JSONDecoder.twitchAPIStandard()
        
        let wrapper = try decoder.decode(UserSubscriptionResponse.self, from: Fixtures.dataFromFixtureFile("UserSubscriptionError"))
        XCTAssertEqual(wrapper.error, "Not Found")
        XCTAssertEqual(wrapper.errorMessage, "twitchdev has no subscription to twitchpresents")
        XCTAssertEqual(wrapper.status, 404)
        XCTAssertNil(wrapper.subscribed)
    }
}
