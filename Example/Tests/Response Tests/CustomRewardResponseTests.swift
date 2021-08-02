//
//  CustomRewardResponseTests.swift
//  TwitchAPIWrapper_Tests
//
//  Created by Eric Vennaro on 8/1/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import TwitchAPIWrapper

class CustomRewardResponseTests: XCTestCase {

    func testBuildModel_shouldSucceed() throws {
        let decoder = JSONDecoder.twitchAPIStandard()
        
        let wrapper = try decoder.decode(CustomAwardResponse.self, from: Fixtures.dataFromFixtureFile("CustomReward"))
        XCTAssertEqual(wrapper.customAwards[0].broadcasterName, "torpedo09")
        XCTAssertEqual(wrapper.customAwards[0].broadcasterLogin, "torpedo09")
        XCTAssertEqual(wrapper.customAwards[0].broadcasterId, "274637212")
        XCTAssertEqual(wrapper.customAwards[0].id, "afaa7e34-6b17-49f0-a19a-d1e76eaaf673")
        XCTAssertNil(wrapper.customAwards[0].image)
        XCTAssertEqual(wrapper.customAwards[0].backgroundColor, "#00E5CB")
        XCTAssertEqual(wrapper.customAwards[0].isEnabled, true)
        XCTAssertEqual(wrapper.customAwards[0].cost, 50000)
        XCTAssertEqual(wrapper.customAwards[0].title, "game analysis 1v1")
        XCTAssertEqual(wrapper.customAwards[0].prompt, "")
        XCTAssertEqual(wrapper.customAwards[0].isUserInputRequired, false)
        XCTAssertEqual(wrapper.customAwards[0].maxPerStreamSetting.isEnabled, false)
        XCTAssertEqual(wrapper.customAwards[0].maxPerStreamSetting.maxPerStream, 0)
        XCTAssertEqual(wrapper.customAwards[0].maxPerUserPerStreamSetting.isEnabled, false)
        XCTAssertEqual(wrapper.customAwards[0].maxPerUserPerStreamSetting.maxPerUserPerStream, 0)
        XCTAssertEqual(wrapper.customAwards[0].globalCooldownSetting.isEnabled, false)
        XCTAssertEqual(wrapper.customAwards[0].globalCooldownSetting.globalCooldownSeconds, 0)
        XCTAssertEqual(wrapper.customAwards[0].isPaused, false)
        XCTAssertEqual(wrapper.customAwards[0].isInStock, true)
        XCTAssertEqual(
            wrapper.customAwards[0].defaultImage,
            [
                "url_1x": "https://static-cdn.jtvnw.net/custom-reward-images/default-1.png",
                "url_2x": "https://static-cdn.jtvnw.net/custom-reward-images/default-2.png",
                "url_4x": "https://static-cdn.jtvnw.net/custom-reward-images/default-4.png"
            ])
        XCTAssertEqual(wrapper.customAwards[0].shouldRedemptionsSkipRequestQueue, false)
        XCTAssertNil(wrapper.customAwards[0].redemptionsRedeemedCurrentStream)
        XCTAssertNil(wrapper.customAwards[0].cooldownExpiresAt)
    }
}
