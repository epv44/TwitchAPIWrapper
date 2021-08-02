//
//  GetCustomRewardRedemptionRequest.swift
//  TwitchAPIWrapper_Tests
//
//  Created by Eric Vennaro on 8/1/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import TwitchAPIWrapper

class GetCustomRewardRedemptionRequest: XCTestCase {

    func testBuildModel_shouldSucceed() throws {
        let decoder = JSONDecoder.twitchAPIStandard()
        
        let wrapper = try decoder.decode(CustomRewardRedemptionResponse.self, from: Fixtures.dataFromFixtureFile("RewardRedemption"))
        XCTAssertEqual(wrapper.pagination?.cursor, "eyJ")
        XCTAssertEqual(wrapper.rewardRedemptions[0].broadcasterName, "torpedo09")
        XCTAssertEqual(wrapper.rewardRedemptions[0].broadcasterLogin, "torpedo09")
        XCTAssertEqual(wrapper.rewardRedemptions[0].broadcasterId, "274637212")
        XCTAssertEqual(wrapper.rewardRedemptions[0].id, "17fa2df1-ad76-4804-bfa5-a40ef63efe63")
        XCTAssertEqual(wrapper.rewardRedemptions[0].userLogin, "torpedo09")
        XCTAssertEqual(wrapper.rewardRedemptions[0].userId, "274637212")
        XCTAssertEqual(wrapper.rewardRedemptions[0].userName, "torpedo09")
        XCTAssertEqual(wrapper.rewardRedemptions[0].userInput, "")
        XCTAssertEqual(wrapper.rewardRedemptions[0].status, RewardStatus.CANCELED)
        XCTAssertEqual(wrapper.rewardRedemptions[0].redeemedAt, ISO8601DateFormatter().date(from: "2020-07-01T18:37:32Z"))
        XCTAssertEqual(wrapper.rewardRedemptions[0].reward.id, "92af127c-7326-4483-a52b-b0da0be61c01")
        XCTAssertEqual(wrapper.rewardRedemptions[0].reward.title, "game analysis")
        XCTAssertEqual(wrapper.rewardRedemptions[0].reward.prompt, "")
        XCTAssertEqual(wrapper.rewardRedemptions[0].reward.cost, 50000)
    }
}
