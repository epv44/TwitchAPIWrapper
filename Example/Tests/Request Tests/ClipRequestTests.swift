//
//  ClipRequestTests.swift
//  TwitchAPIWrapper_Tests
//
//  Created by Eric Vennaro on 8/2/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import TwitchAPIWrapper

class ClipRequestTests: XCTestCase {

    override func setUpWithError() throws {
        TwitchAuthorizationManager.sharedInstance.clientID = "1"
        TwitchAuthorizationManager.sharedInstance.credentials = Credentials(accessToken: "XXX", scopes: ["user", "read"])
        super.setUp()
    }

    func testBuildUpdateRequest_shouldSucceed() throws {
        let request = try ClipRequest(httpMethod: .post, ids: nil, gameID: nil, broadcasterID: "1")
        XCTAssertEqual(
            request.url!.absoluteString,
            expectedURL: "https://api.twitch.tv/helix/clips?broadcaster_id=1")
        XCTAssertEqual(request.headers, ["Client-Id": "1", "Authorization": "Bearer XXX"])
    }
    
    func testBuildGetRequest_shouldSucceed() throws {
        let request = try ClipRequest(httpMethod: .get, ids: ["2"], gameID: nil, broadcasterID: "1")
        XCTAssertEqual(
            request.url!.absoluteString,
            expectedURL: "https://api.twitch.tv/helix/clips?broadcaster_id=1&id=2")
        XCTAssertEqual(request.headers, ["Client-Id": "1", "Authorization": "Bearer XXX"])
    }
    
    func testBuildRequest_withoutIds_shouldFail() {
        XCTAssertThrowsError(try ClipRequest(httpMethod: .get, ids: nil, gameID: nil, broadcasterID: nil), "") { error in
            XCTAssertEqual(error.localizedDescription, "The operation couldn’t be completed. (TwitchAPIWrapper.RequestValidationError error 0.)")
        }
    }
}
