//
//  WebhookSubscriptionsRequestTests.swift
//  TwitchAPIWrapper_Tests
//
//  Created by Eric Vennaro on 5/28/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
import TwitchAPIWrapper

class WebhookSubscriptionsRequestTests: XCTestCase {

    override func setUpWithError() throws {
        TwitchAuthorizationManager.sharedInstance.clientID = "1"
        TwitchAuthorizationManager.sharedInstance.credentials = Credentials(accessToken: "XXX", scopes: ["user", "read"])
        super.setUp()
    }

    func testBuildRequest_withRequiredParams_shouldSucceed() {
        let request = WebhookSubscriptionsRequest()
        XCTAssertEqual(request.url?.host, "api.twitch.tv")
        XCTAssertEqual(request.url?.path, "/webhooks/subscriptions")
        XCTAssertEqual(
            request.url!.absoluteString,
            expectedURL: "https://api.twitch.tv/helix/webhooks/subscriptions")
        XCTAssertEqual(request.data, Data())
        XCTAssertEqual(request.headers, ["Client-Id": "1", "Authorization": "Bearer XXX"])
    }
    
    func testBuildRequest_withAllParams_shouldSucceed() {
        let request = WebhookSubscriptionsRequest(after: "aft", first: "fir")
        XCTAssertEqual(request.url?.host, "api.twitch.tv")
        XCTAssertEqual(request.url?.path, "/webhooks/subscriptions")
        XCTAssertEqual(
            request.url!.absoluteString,
            expectedURL: "https://api.twitch.tv/helix/webhooks/subscriptions?after=aft&first=fir")
        XCTAssertEqual(request.data, Data())
        XCTAssertEqual(request.headers, ["Client-Id": "1", "Authorization": "Bearer XXX"])
    }
}
