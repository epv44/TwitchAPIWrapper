//
//  TeamsResponseTests.swift
//  TwitchAPIWrapper_Tests
//
//  Created by Eric Vennaro on 6/9/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import TwitchAPIWrapper

class TeamsResponseTests: XCTestCase {

    func testBuildModel_shouldSucceed() throws {
        let decoder = JSONDecoder.twitchAPIStandard()
        
        let wrapper = try decoder.decode(TeamResponse.self, from: Fixtures.dataFromFixtureFile("Teams"))
        XCTAssertNil(wrapper.teams[0].backgroundImageUrl)
        XCTAssertNil(wrapper.teams[0].banner)
        XCTAssertEqual(wrapper.teams[0].users[0].userId, "278217731")
        XCTAssertEqual(wrapper.teams[0].users[0].userName, "mastermndio")
        XCTAssertEqual(wrapper.teams[0].users[0].userLogin, "mastermndio")
        XCTAssertEqual(wrapper.teams[0].users[1].userId, "41284990")
        XCTAssertEqual(wrapper.teams[0].users[1].userName, "jenninexus")
        XCTAssertEqual(wrapper.teams[0].users[1].userLogin, "jenninexus")
        XCTAssertEqual(wrapper.teams[0].createdAt, ISO8601DateFormatter().date(from: "2019-02-11T12:09:22Z"))
        XCTAssertEqual(wrapper.teams[0].updatedAt, ISO8601DateFormatter().date(from: "2020-11-18T15:56:41Z"))
        XCTAssertEqual(wrapper.teams[0].info, "<p>An outgoing and enthusiastic group of friendly channels that write code, teach about technology, and promote the technical community.</p>")
        XCTAssertEqual(wrapper.teams[0].thumbnailUrl, URL(string: "https://static-cdn.jtvnw.net/jtv_user_pictures/team-livecoders-team_logo_image-bf1d9a87ca81432687de60e24ad9593d-600x600.png"))
        XCTAssertEqual(wrapper.teams[0].teamName, "livecoders")
        XCTAssertEqual(wrapper.teams[0].teamDisplayName, "Live Coders")
        XCTAssertEqual(wrapper.teams[0].id, "6358")
    }
}
