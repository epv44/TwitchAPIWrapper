//
//  CheckAutoModStatusRequestTests.swift
//  TwitchAPIWrapper_Tests
//
//  Created by Eric Vennaro on 6/14/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import TwitchAPIWrapper

class CheckAutoModStatusRequestTests: XCTestCase {

    override func setUpWithError() throws {
        TwitchAuthorizationManager.sharedInstance.clientID = "1"
        TwitchAuthorizationManager.sharedInstance.credentials = Credentials(accessToken: "XXX", scopes: ["user", "read"])
        super.setUp()
    }

    func testBuildRequest_withRequiredParams_shouldSucceed() throws {
        let request = try CheckAutoModStatusRequest(broadcasterID: "1", data: [AutoModStatusData(msgID: "3", msgText: "blah blah", userID: "10")])
        XCTAssertEqual(
            request.url!.absoluteString,
            expectedURL: "https://api.twitch.tv/helix/moderation/enforcements/status?broadcaster_id=1")
        let d = try JSONSerialization.jsonObject(with: request.data, options: .allowFragments) as! [[String:String]]
        XCTAssertEqual(d, [["user_id": "10", "msg_id": "3", "msg_text": "blah blah"]])
        XCTAssertEqual(request.headers, ["Client-Id": "1", "Authorization": "Bearer XXX"])
    }
}
