//
//  ManageHeldAutoModMessagesRequestTests.swift
//  TwitchAPIWrapper_Tests
//
//  Created by Eric Vennaro on 6/14/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import TwitchAPIWrapper

class ManageHeldAutoModMessagesRequestTests: XCTestCase {

    override func setUpWithError() throws {
        TwitchAuthorizationManager.sharedInstance.clientID = "1"
        TwitchAuthorizationManager.sharedInstance.credentials = Credentials(accessToken: "XXX", scopes: ["user", "read"])
        super.setUp()
    }

    func testBuildRequest_withRequiredParams_shouldSucceed() throws {
        let request = try ManageHeldAutoModStatusRequest(userID: "1", msgID: "2", action: "3")
        XCTAssertEqual(
            request.url!.absoluteString,
            expectedURL: "https://api.twitch.tv/helix/moderation/automod/message")
        let d = try JSONSerialization.jsonObject(with: request.data, options: .allowFragments) as! [String:String]
        XCTAssertEqual(d, ["user_id": "1", "msg_id": "2", "action": "3"])
        XCTAssertEqual(request.headers, ["Client-Id": "1", "Authorization": "Bearer XXX"])
    }
}
