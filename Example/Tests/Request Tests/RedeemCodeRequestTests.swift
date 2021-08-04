//
//  RedeemCodeRequestTests.swift
//  TwitchAPIWrapper_Tests
//
//  Created by Eric Vennaro on 8/3/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import TwitchAPIWrapper

class RedeemCodeRequestTests: XCTestCase {

    override func setUpWithError() throws {
        TwitchAuthorizationManager.sharedInstance.clientID = "1"
        TwitchAuthorizationManager.sharedInstance.credentials = Credentials(accessToken: "XXX", scopes: ["user", "read"])
        super.setUp()
    }

    func testBuildRequest_withRequiredParams_shouldSucceed() {
        let request = RedeemCodeRequest(userID: "1", codes: ["2","3"])
        XCTAssertEqual(
            request.url!.absoluteString,
            expectedURL: "https://api.twitch.tv/helix/entitlements/codes?user_id=1&code=2&code=3")
        XCTAssertEqual(request.headers, ["Client-Id": "1", "Authorization": "Bearer XXX"])
    }
}
