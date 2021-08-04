//
//  CustomRewardRedemptionRequestTests.swift
//  TwitchAPIWrapper_Tests
//
//  Created by Eric Vennaro on 8/2/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import TwitchAPIWrapper

class CustomRewardRedemptionRequestTests: XCTestCase {

    override func setUpWithError() throws {
        TwitchAuthorizationManager.sharedInstance.clientID = "1"
        TwitchAuthorizationManager.sharedInstance.credentials = Credentials(accessToken: "XXX", scopes: ["user", "read"])
        super.setUp()
    }

    func testBuildUpdateRequest_shouldSucceed() throws {
        let request = try CustomRewardRedemptionRequest(httpMethod: .patch, broadcasterID: "1", rewardID: "2", id: "3", status: "CANCELED")
        XCTAssertEqual(
            request.url!.absoluteString,
            expectedURL: "https://api.twitch.tv/helix/channel_points/custom_rewards/redemptions?broadcaster_id=1&reward_id=2&id=3")
        let d = try JSONSerialization.jsonObject(with: request.data, options: .allowFragments) as! [String:String]
        XCTAssertEqual(d, ["status": "CANCELED"])
        XCTAssertEqual(request.headers, ["Client-Id": "1", "Authorization": "Bearer XXX"])
    }
}
