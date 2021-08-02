//
//  CustomRewardsRequestTests.swift
//  TwitchAPIWrapper_Tests
//
//  Created by Eric Vennaro on 8/1/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import TwitchAPIWrapper

class CustomRewardsRequestTests: XCTestCase {

    override func setUpWithError() throws {
        TwitchAuthorizationManager.sharedInstance.clientID = "1"
        TwitchAuthorizationManager.sharedInstance.credentials = Credentials(accessToken: "XXX", scopes: ["user", "read"])
        super.setUp()
    }

    func testBuildCreateRequest_shouldSucceed() throws {
        let request = try CustomRewardRequest(httpMethod: .post, broadcasterID: "1", title: "hi", cost: "5")
        XCTAssertEqual(
            request.url!.absoluteString,
            expectedURL: "https://api.twitch.tv/helix/channel_points/custom_rewards?broadcaster_id=1")
        let d = try JSONSerialization.jsonObject(with: request.data, options: .allowFragments) as! [String:String]
        XCTAssertEqual(d, ["title": "hi", "cost": "5"])
        XCTAssertEqual(request.headers, ["Client-Id": "1", "Authorization": "Bearer XXX"])
    }
    
    func testBuildDeleteRequest_shouldSucceed() throws {
        let request = try CustomRewardRequest(httpMethod: .delete, broadcasterID: "1")
        XCTAssertEqual(
            request.url!.absoluteString,
            expectedURL: "https://api.twitch.tv/helix/channel_points/custom_rewards?broadcaster_id=1")
        XCTAssertEqual(request.headers, ["Client-Id": "1", "Authorization": "Bearer XXX"])
    }
    
    func testBuildGetRequest_shouldSucceed() throws {
        let request = try CustomRewardRequest(httpMethod: .get, broadcasterID: "1")
        XCTAssertEqual(
            request.url!.absoluteString,
            expectedURL: "https://api.twitch.tv/helix/channel_points/custom_rewards?broadcaster_id=1")
        XCTAssertEqual(request.headers, ["Client-Id": "1", "Authorization": "Bearer XXX"])
    }
}
