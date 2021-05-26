//
//  UserRequestTests.swift
//  TwitchAPIWrapperTestsiOS
//
//  Created by Eric Vennaro on 4/4/18.
//

import XCTest

@testable import TwitchAPIWrapper

class UserRequestTests: XCTestCase {
    func testBuildUserRequest() {
        let request = UserRequest()
        XCTAssertEqual(request.url?.absoluteString, "https://api.twitch.tv/helix/users?")
        XCTAssertEqual(request.method, .get)
        XCTAssertEqual(request.data, Data())
        XCTAssertEqual(request.headers, [:])
    }
    
    func testBuildUserRequest_withEverything() {
        let request = UserRequest(id: ["1"], login: ["geazy"])
        XCTAssertEqual(request.url?.absoluteString, "https://api.twitch.tv/helix/users?id=1&login=geazy")
        XCTAssertEqual(request.method, .get)
        XCTAssertEqual(request.data, Data())
        XCTAssertEqual(request.headers, [:])
    }
}
