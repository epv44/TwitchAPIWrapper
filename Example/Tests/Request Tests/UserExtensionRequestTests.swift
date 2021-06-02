//
//  UserExtensionRequestTests.swift
//  TwitchAPIWrapper_Tests
//
//  Created by Eric Vennaro on 6/1/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import TwitchAPIWrapper

class UserExtensionRequestTests: XCTestCase {

    override func setUpWithError() throws {
        TwitchAuthorizationManager.sharedInstance.clientID = "1"
        TwitchAuthorizationManager.sharedInstance.credentials = Credentials(accessToken: "XXX", scopes: ["user", "read"])
        super.setUp()
    }

    func testBuildRequest_withRequiredParams_shouldSucceed() {
        let request = UserExtensionRequest()
        XCTAssertEqual(request.url?.host, "api.twitch.tv")
        XCTAssertEqual(request.url?.path, "/users/extensions/list")
        XCTAssertEqual(
            request.url!.absoluteString,
            expectedURL: "https://api.twitch.tv/helix/users/extensions/list")
        XCTAssertEqual(request.headers, ["Client-Id": "1", "Authorization": "Bearer XXX"])
    }
}
