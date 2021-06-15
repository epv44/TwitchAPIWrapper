//
//  GetBannedUserResponseTests.swift
//  TwitchAPIWrapper_Tests
//
//  Created by Eric Vennaro on 6/14/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import TwitchAPIWrapper

class GetBannedUserResponseTests: XCTestCase {

    func testBuildModel_shouldSucceed() throws {
        let decoder = JSONDecoder.twitchAPIStandard()
        
        let wrapper = try decoder.decode(BannedUsersResponse.self, from: Fixtures.dataFromFixtureFile("BannedUser"))
        XCTAssertEqual(wrapper.pagination.cursor, "eyJiIjpudWxsLCJhIjp7IkN1cnNvciI6IjEwMDQ3MzA2NDo4NjQwNjU3MToxSVZCVDFKMnY5M1BTOXh3d1E0dUdXMkJOMFcifX0")
        XCTAssertEqual(wrapper.bannedUsers[0].userId, "423374343")
        XCTAssertEqual(wrapper.bannedUsers[0].userLogin, "glowillig")
        XCTAssertEqual(wrapper.bannedUsers[0].userName, "glowillig")
        XCTAssertEqual(wrapper.bannedUsers[0].expiresAt, ISO8601DateFormatter().date(from: "2019-03-15T02:00:28Z"))
    }
}
