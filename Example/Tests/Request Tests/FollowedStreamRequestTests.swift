//
//  FollowedStreamRequestTests.swift
//  TwitchAPIWrapper_Tests
//
//  Created by Eric Vennaro on 6/9/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import TwitchAPIWrapper

class FollowedStreamRequestTests: XCTestCase {

    override func setUpWithError() throws {
        TwitchAuthorizationManager.sharedInstance.clientID = "1"
        TwitchAuthorizationManager.sharedInstance.credentials = Credentials(accessToken: "XXX", scopes: ["user", "read"])
        super.setUp()
    }

    func testBuildRequest_withRequiredParams_shouldSucceed() {
        let request = FollowedStreamsRequest(userID: "1")
        XCTAssertEqual(
            request.url!.absoluteString,
            expectedURL: "https://api.twitch.tv/helix/streams/followed?user_id=1")
        XCTAssertEqual(request.data, Data())
        XCTAssertEqual(request.headers, ["Client-Id": "1", "Authorization": "Bearer XXX"])
    }
    
    func testBuildRequest_withOptionalParams_shouldSucceed() {
        let request = FollowedStreamsRequest(userID: "1", after: "2", first: "3")
        XCTAssertEqual(
            request.url!.absoluteString,
            expectedURL: "https://api.twitch.tv/helix/streams/followed?user_id=1&after=2&first=3")
        XCTAssertEqual(request.data, Data())
        XCTAssertEqual(request.headers, ["Client-Id": "1", "Authorization": "Bearer XXX"])
    }
}
