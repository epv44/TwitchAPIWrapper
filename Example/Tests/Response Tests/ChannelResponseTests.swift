//
//  ChannelResponseTests.swift
//  TwitchAPIWrapper_Tests
//
//  Created by Eric Vennaro on 6/9/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import TwitchAPIWrapper

class ChannelResponseTests: XCTestCase {

    func testBuildModel_shouldSucceed() throws {
        let decoder = JSONDecoder.twitchAPIStandard()
        
        let wrapper = try decoder.decode(ChannelTeamResponse.self, from: Fixtures.dataFromFixtureFile("Channel"))
        XCTAssertEqual(wrapper.channelTeams[0].broadcasterId, "96909659")
        XCTAssertEqual(wrapper.channelTeams[0].broadcasterName, "CSharpFritz")
        XCTAssertEqual(wrapper.channelTeams[0].broadcasterLogin, "csharpfritz")
        XCTAssertNil(wrapper.channelTeams[0].backgroundImageUrl)
        XCTAssertNil(wrapper.channelTeams[0].banner)
        XCTAssertEqual(wrapper.channelTeams[0].createdAt, ISO8601DateFormatter().date(from: "2019-02-11T12:09:22Z"))
        XCTAssertEqual(wrapper.channelTeams[0].updatedAt, ISO8601DateFormatter().date(from: "2020-11-18T15:56:41Z"))
        XCTAssertEqual(wrapper.channelTeams[0].info, "<p>An outgoing and enthusiastic group of friendly channels that write code, teach about technology, and promote the technical community.</p>")
        XCTAssertEqual(wrapper.channelTeams[0].thumbnailUrl, URL(string: "https://static-cdn.jtvnw.net/jtv_user_pictures/team-livecoders-team_logo_image-bf1d9a87ca81432687de60e24ad9593d-600x600.png"))
        XCTAssertEqual(wrapper.channelTeams[0].teamName, "livecoders")
        XCTAssertEqual(wrapper.channelTeams[0].teamDisplayName, "Live Coders")
        XCTAssertEqual(wrapper.channelTeams[0].id, "6358")
    }
}
