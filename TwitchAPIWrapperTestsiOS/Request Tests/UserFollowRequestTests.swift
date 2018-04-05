//
//  UserFollowRequestTests.swift
//  TwitchAPIWrapperTestsiOS
//
//  Created by Eric Vennaro on 4/4/18.
//

import XCTest

@testable import TwitchAPIWrapper

class UserFollowRequestTests: XCTestCase {
    func testBuildUserFollowRequest() {
        let request = UserFollowRequest()
        XCTAssertEqual(request.url?.absoluteString, "https://api.twitch.tv/helix/users/follows?")
        XCTAssertEqual(request.method, "GET")
        XCTAssertEqual(request.data, Data())
        XCTAssertEqual(request.headers, [:])
    }
    
    func testBuildUserFollowRequest_withEverything() {
        let request = UserFollowRequest(after: "10", first: "1", fromId: "123", toId: "678")
        XCTAssertEqual(request.url?.absoluteString, "https://api.twitch.tv/helix/users/follows?from_id=123&after=10&first=1&to_id=678")
        XCTAssertEqual(request.method, "GET")
        XCTAssertEqual(request.data, Data())
        XCTAssertEqual(request.headers, [:])
    }
}

