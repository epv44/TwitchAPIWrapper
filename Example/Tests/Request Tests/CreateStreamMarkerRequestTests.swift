//
//  CreateStreamMarkerRequestTests.swift
//  TwitchAPIWrapper_Tests
//
//  Created by Eric Vennaro on 6/9/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import TwitchAPIWrapper

class CreateStreamMarkerRequestTests: XCTestCase {
    
    override func setUpWithError() throws {
        TwitchAuthorizationManager.sharedInstance.clientID = "1"
        TwitchAuthorizationManager.sharedInstance.credentials = Credentials(accessToken: "XXX", scopes: ["user", "read"])
        super.setUp()
    }

    func testBuildRequest_withRequiredParam_shouldSucceed() throws {
        let request = try CreateStreamMarkerRequest(userID: "1", description: "describe me")
        XCTAssertEqual(
            request.url!.absoluteString,
            expectedURL: "https://api.twitch.tv/helix/streams/markers")
        let d = try JSONSerialization.jsonObject(with: request.data, options: .allowFragments) as! [String:String]
        XCTAssertEqual(d, ["user_id": "1", "description": "describe me"])
        XCTAssertEqual(request.headers, ["Client-Id": "1", "Authorization": "Bearer XXX"])
    }
}
