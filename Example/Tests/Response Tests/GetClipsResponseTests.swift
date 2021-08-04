//
//  GetClipsResponseTests.swift
//  TwitchAPIWrapper_Tests
//
//  Created by Eric Vennaro on 8/2/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import TwitchAPIWrapper

class GetClipsResponseTests: XCTestCase {

    func testBuildModel_shouldSucceed() throws {
        let decoder = JSONDecoder.twitchAPIStandard()
        let wrapper = try decoder.decode(ClipResponse.self, from: Fixtures.dataFromFixtureFile("GetClips"))
        XCTAssertEqual(wrapper.clips[0].id, "AwkwardHelplessSalamanderSwiftRage")
        XCTAssertEqual(wrapper.clips[0].url, URL(string: "https://clips.twitch.tv/AwkwardHelplessSalamanderSwiftRage"))
        XCTAssertEqual(
            wrapper.clips[0].embedUrl,
            URL(string: "https://clips.twitch.tv/embed?clip=AwkwardHelplessSalamanderSwiftRage"))
        XCTAssertEqual(wrapper.clips[0].broadcasterId, "67955580")
        XCTAssertEqual(wrapper.clips[0].broadcasterName, "ChewieMelodies")
        XCTAssertEqual(wrapper.clips[0].creatorId, "53834192")
        XCTAssertEqual(wrapper.clips[0].creatorName, "BlackNova03")
        XCTAssertEqual(wrapper.clips[0].videoId, "205586603")
        XCTAssertEqual(wrapper.clips[0].gameId, "488191")
        XCTAssertEqual(wrapper.clips[0].language, "en")
        XCTAssertEqual(wrapper.clips[0].title, "babymetal")
        XCTAssertEqual(wrapper.clips[0].viewCount, 10)
        XCTAssertEqual(wrapper.clips[0].createdAt, ISO8601DateFormatter().date(from: "2017-11-30T22:34:18Z"))
        XCTAssertEqual(
            wrapper.clips[0].thumbnailUrl,
            URL(string: "https://clips-media-assets.twitch.tv/157589949-preview-480x272.jpg"))
        XCTAssertEqual(wrapper.clips[0].duration, 60)
        XCTAssertNil(wrapper.pagination?.cursor)
    }
}
