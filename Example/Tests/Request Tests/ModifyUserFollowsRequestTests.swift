//
//  DeleteUserFollowsRequestTests.swift
//  TwitchAPIWrapper_Tests
//
//  Created by Eric Vennaro on 6/9/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import TwitchAPIWrapper

class ModifyUserFollowsRequestTests: XCTestCase {
    
    override func setUpWithError() throws {
        TwitchAuthorizationManager.sharedInstance.clientID = "1"
        TwitchAuthorizationManager.sharedInstance.credentials = Credentials(accessToken: "XXX", scopes: ["user", "read"])
        super.setUp()
    }

    func testBuildDeleteRequest_withRequiredParams_shouldSucceed() {
        let request = try! ModifyUserFollowRequest(httpMethod: .delete, fromID: "1", toID: "2")
        XCTAssertEqual(request.url?.host, "api.twitch.tv")
        XCTAssertEqual(request.url?.path, "/helix/users/follows")
        XCTAssertEqual(
            request.url!.absoluteString,
            expectedURL: "https://api.twitch.tv/users/follows?from_id=1&to_id=2")
        XCTAssertEqual(request.data, Data())
        XCTAssertEqual(request.headers, ["Client-Id": "1", "Authorization": "Bearer XXX"])
    }
    
    func testBuildCreateRequest_withRequiredParams_shouldSucceed() throws {
        let request = try! ModifyUserFollowRequest(httpMethod: .post, fromID: "1", toID: "2", allowNotifications: true)
        XCTAssertEqual(request.url?.host, "api.twitch.tv")
        XCTAssertEqual(request.url?.path, "/helix/users/follows")
        XCTAssertEqual(
            request.url!.absoluteString,
            expectedURL: "https://api.twitch.tv/users/follows")
        let d = try JSONSerialization.jsonObject(with: request.data, options: .allowFragments) as! [String:String]
        XCTAssertEqual(d["to_id"], "2")
        XCTAssertEqual(d["from_id"], "1")
        XCTAssertEqual(d["allow_notifications"], "true")
        XCTAssertEqual(request.headers, ["Client-Id": "1", "Authorization": "Bearer XXX"])
    }
    
    func testBuildRequest_withoutWrongHTTPMethod_shouldFail() {
        XCTAssertThrowsError(try ModifyUserFollowRequest(httpMethod: .get, fromID: "1", toID: "2"), "") { error in
            print(error.localizedDescription)
            XCTAssertEqual(error.localizedDescription, "The operation couldn’t be completed. (TwitchAPIWrapper.RequestValidationError error 0.)")
        }
    }
}
