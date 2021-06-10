//
//  GetUserFollowRequestTests.swift
//  TwitchAPIWrapper_Tests
//
//  Created by Eric Vennaro on 6/9/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import TwitchAPIWrapper


class GetUserFollowRequestTests: XCTestCase {

    override func setUpWithError() throws {
        TwitchAuthorizationManager.sharedInstance.clientID = "1"
        TwitchAuthorizationManager.sharedInstance.credentials = Credentials(accessToken: "XXX", scopes: ["user", "read"])
        super.setUp()
    }

    func testBuildRequest_withRequiredParam_shouldSucceed() {
        let request = try! UserFollowRequest(after: nil, first: nil, fromID: "1", toID: nil)
        XCTAssertEqual(request.url?.host, "api.twitch.tv")
        XCTAssertEqual(request.url?.path, "/helix/users/follows")
        XCTAssertEqual(
            request.url!.absoluteString,
            expectedURL: "https://api.twitch.tv/users/follows?from_id=1")
        XCTAssertEqual(request.data, Data())
        XCTAssertEqual(request.headers, ["Client-Id": "1", "Authorization": "Bearer XXX"])
    }
    
    func testBuildRequest_withOtherRequiredParam_shouldSucceed() {
        let request = try! UserFollowRequest(after: nil, first: nil, fromID: nil, toID: "2")
        XCTAssertEqual(request.url?.host, "api.twitch.tv")
        XCTAssertEqual(request.url?.path, "/helix/users/follows")
        XCTAssertEqual(
            request.url!.absoluteString,
            expectedURL: "https://api.twitch.tv/users/follows?to_id=2")
        XCTAssertEqual(request.data, Data())
        XCTAssertEqual(request.headers, ["Client-Id": "1", "Authorization": "Bearer XXX"])
    }
    
    func testBuildRequest_withAllParams_shouldSucceed() {
        let request = try! UserFollowRequest(after: "a", first: "f", fromID: "1", toID: "2")
        XCTAssertEqual(request.url?.host, "api.twitch.tv")
        XCTAssertEqual(request.url?.path, "/helix/users/follows")
        XCTAssertEqual(
            request.url!.absoluteString,
            expectedURL: "https://api.twitch.tv/users/follows?from_id=1&to_id=2&after=a&first=f")
        XCTAssertEqual(request.data, Data())
        XCTAssertEqual(request.headers, ["Client-Id": "1", "Authorization": "Bearer XXX"])
    }
    
    func testBuildRequest_withoutRequiredParams_shouldFail() {
        XCTAssertThrowsError(try UserFollowRequest(after: nil, first: nil, fromID: nil, toID: nil), "") { error in
            print(error.localizedDescription)
            XCTAssertEqual(error.localizedDescription, "The operation couldn’t be completed. (TwitchAPIWrapper.RequestValidationError error 0.)")
        }
    }
}
