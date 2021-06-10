//
//  UserResponseTests.swift
//  TwitchAPIWrapper_Tests
//
//  Created by Eric Vennaro on 6/9/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import TwitchAPIWrapper

class UserResponseTests: XCTestCase {

    func testBuildModel_shouldSucceed() throws {
        let decoder = JSONDecoder.twitchAPIStandard()
        
        let wrapper = try! decoder.decode(UserResponse.self, from: Fixtures.dataFromFixtureFile("UpdateUser"))
        XCTAssertEqual(wrapper.users[0].id, "44322889")
        XCTAssertEqual(wrapper.users[0].login, "dallas")
        XCTAssertEqual(wrapper.users[0].displayName, "dallas")
        XCTAssertEqual(wrapper.users[0].type, UserType.staff)
        XCTAssertEqual(wrapper.users[0].broadcasterType, BroadcasterType.affiliate)
        XCTAssertEqual(wrapper.users[0].description , "BaldAngel")
        XCTAssertEqual(wrapper.users[0].profileImageUrl, URL(string: "https://static-cdn.jtvnw.net/jtv_user_pictures/4d1f36cbf1f0072d-profile_image-300x300.png"))
        XCTAssertEqual(wrapper.users[0].offlineImageUrl, URL(string:"https://static-cdn.jtvnw.net/jtv_user_pictures/dallas-channel_offline_image-2e82c1df2a464df7-1920x1080.jpeg"))
        XCTAssertEqual(wrapper.users[0].viewCount, 6995)
        XCTAssertEqual(wrapper.users[0].email, "not-real@email.com")
        XCTAssertEqual(wrapper.users[0].createdAt, "2013-06-03T19:12:02.580593Z")
    }
}
