//
//  DeleteVideoRequestTests.swift
//  TwitchAPIWrapper_Tests
//
//  Created by Eric Vennaro on 5/28/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import TwitchAPIWrapper

class DeleteVideoRequestTests: XCTestCase {

    override func setUpWithError() throws {
        TwitchAuthorizationManager.sharedInstance.clientID = "1"
        TwitchAuthorizationManager.sharedInstance.credentials = Credentials(accessToken: "XXX", scopes: ["user", "read"])
        super.setUp()
    }

    func testBuildRequest_withRequiredParams_shouldSucceed() {
        let request = try! DeleteVideoRequest(ids: ["1", "2"])
        XCTAssertEqual(request.url?.host, "api.twitch.tv")
        XCTAssertEqual(request.url?.path, "/helix/videos")
        XCTAssertEqual(
            request.url!.absoluteString,
            expectedURL: "https://api.twitch.tv/helix/videos?id=1&id=2")
        XCTAssertEqual(request.data, Data())
        XCTAssertEqual(request.headers, ["Client-Id": "1", "Authorization": "Bearer XXX"])
    }
    
    func testBuildRequest_withoutIds_shouldFail() {
        XCTAssertThrowsError(try DeleteVideoRequest(ids: []), "") { error in
            print(error.localizedDescription)
            XCTAssertEqual(error.localizedDescription, "The operation couldn’t be completed. (TwitchAPIWrapper.RequestValidationError error 0.)")
        }
    }
}
