//
//  GetStreamMarkersRequestTests.swift
//  TwitchAPIWrapper_Tests
//
//  Created by Eric Vennaro on 6/9/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import TwitchAPIWrapper

class GetStreamMarkersRequestTests: XCTestCase {

    override func setUpWithError() throws {
        TwitchAuthorizationManager.sharedInstance.clientID = "1"
        TwitchAuthorizationManager.sharedInstance.credentials = Credentials(accessToken: "XXX", scopes: ["user", "read"])
        super.setUp()
    }

    func testBuildRequest_withRequiredParam_shouldSucceed() throws {
        let request = try GetStreamMarkersRequest(userID: "1")
        XCTAssertEqual(
            request.url!.absoluteString,
            expectedURL: "https://api.twitch.tv/helix/streams/markers?user_id=1")
        XCTAssertEqual(request.data, Data())
        XCTAssertEqual(request.headers, ["Client-Id": "1", "Authorization": "Bearer XXX"])
    }
    
    func testBuildRequest_withOptionalParam_shouldSucceed() throws {
        let request = try GetStreamMarkersRequest(userID: "1", videoID: "2", after: "3", before: "4", first: "5")
        XCTAssertEqual(
            request.url!.absoluteString,
            expectedURL: "https://api.twitch.tv/helix/streams/markers?user_id=1&video_id=2&after=3&before=4&first=5")
        XCTAssertEqual(request.data, Data())
        XCTAssertEqual(request.headers, ["Client-Id": "1", "Authorization": "Bearer XXX"])
    }
    
    func testBuildRequest_withoutUserOrVideoId_shouldFail() {
        XCTAssertThrowsError(try GetStreamMarkersRequest(), "") { error in
            XCTAssertEqual(error.localizedDescription, "The operation couldn’t be completed. (TwitchAPIWrapper.RequestValidationError error 0.)")
        }
    }
}
