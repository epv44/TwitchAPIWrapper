//
//  StreamsResponseTests.swift
//  TwitchAPIWrapper_Tests
//
//  Created by Eric Vennaro on 6/9/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import TwitchAPIWrapper

class StreamsResponseTests: XCTestCase {

    func testBuildModel_shouldSucceed() throws {
        let decoder = JSONDecoder.twitchAPIStandard()
        
        let wrapper = try decoder.decode(StreamResponse.self, from: Fixtures.dataFromFixtureFile("Stream"))
        XCTAssertEqual(wrapper.pagination?.cursor, "xxx")
        XCTAssertEqual(wrapper.streams[0].id, "42170724654")
        XCTAssertEqual(wrapper.streams[0].userId, "132954738")
        XCTAssertEqual(wrapper.streams[0].userLogin, "aws")
        XCTAssertEqual(wrapper.streams[0].userName, "AWS")
        XCTAssertEqual(wrapper.streams[0].gameId, "417752")
        XCTAssertEqual(wrapper.streams[0].gameName, "Talk Shows & Podcasts")
        XCTAssertEqual(wrapper.streams[0].type, StreamType.live)
        XCTAssertEqual(wrapper.streams[0].title, "AWS Howdy Partner! Y'all welcome ExtraHop to the show!")
        XCTAssertEqual(wrapper.streams[0].viewerCount, 20)
        XCTAssertEqual(wrapper.streams[0].startedAt, ISO8601DateFormatter().date(from: "2021-03-31T20:57:26Z"))
        XCTAssertEqual(wrapper.streams[0].language, "en")
        XCTAssertEqual(wrapper.streams[0].thumbnailUrl, "https://static-cdn.jtvnw.net/previews-ttv/live_user_aws-{width}x{height}.jpg")
        XCTAssertEqual(wrapper.streams[0].tagIds, ["6ea6bca4-4712-4ab9-a906-e3336a9d8039"])
    }
}
