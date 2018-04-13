//
//  UpdateUserRequestTests.swift
//  TwitchAPIWrapperTestsiOS
//
//  Created by Eric Vennaro on 4/11/18.
//

import XCTest

@testable import TwitchAPIWrapper

class UserUpdateRequestTests: XCTestCase {
    func testBuildUserRequest() {
        let request = UserUpdateRequest(description: "honeybadger")
        XCTAssertEqual(request.url?.absoluteString, "https://api.twitch.tv/helix/users?description=honeybadger")
        XCTAssertEqual(request.method, .put)
        XCTAssertEqual(request.data, Data())
        XCTAssertEqual(request.headers, [:])
    }
}
