//
//  ReplaceStreamTagsRequestTests.swift
//  TwitchAPIWrapper_Tests
//
//  Created by Eric Vennaro on 6/9/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import TwitchAPIWrapper

class ReplaceStreamTagsRequestTests: XCTestCase {

    override func setUpWithError() throws {
        TwitchAuthorizationManager.sharedInstance.clientID = "1"
        TwitchAuthorizationManager.sharedInstance.credentials = Credentials(accessToken: "XXX", scopes: ["user", "read"])
        super.setUp()
    }

    func testBuildRequest_withRequiredParams_shouldSucceed() throws {
        let request = try ReplaceStreamTagRequest(broadcasterID: "1", tagIDs: ["1", "2"])
        XCTAssertEqual(
            request.url!.absoluteString,
            expectedURL: "https://api.twitch.tv/helix/streams/tags?broadcaster_id=1")
        let d = try JSONSerialization.jsonObject(with: request.data, options: .allowFragments) as! [String:[String]]
        XCTAssertEqual(d["tag_ids"], ["1", "2"])
        XCTAssertEqual(request.headers, ["Client-Id": "1", "Authorization": "Bearer XXX"])
    }
}
