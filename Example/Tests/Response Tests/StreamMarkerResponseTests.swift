//
//  StreamMarkerResponseTests.swift
//  TwitchAPIWrapper_Tests
//
//  Created by Eric Vennaro on 6/9/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import TwitchAPIWrapper

class StreamMarkerResponseTests: XCTestCase {

    func testBuildModel_shouldSucceed() throws {
        let decoder = JSONDecoder.twitchAPIStandard()
        
        let wrapper = try decoder.decode(StreamMarkerResponse.self, from: Fixtures.dataFromFixtureFile("StreamMarkers"))
        XCTAssertEqual(wrapper.pagination.cursor, "eyJiIjpudWxsLCJhIjoiMjk1MjA0Mzk3OjI1Mzpib29rbWFyazoxMDZiOGQ1Y")
        XCTAssertEqual(wrapper.streamMarkers[0].userId, "123")
        XCTAssertEqual(wrapper.streamMarkers[0].userName, "TwitchName")
        XCTAssertEqual(wrapper.streamMarkers[0].userLogin, "twitchname")
        XCTAssertEqual(wrapper.streamMarkers[0].videos[0].videoId, "456")
        XCTAssertEqual(wrapper.streamMarkers[0].videos[0].markers[0].id, "106b8d6243a4f883d25ad75e6cdffdc4")
        XCTAssertEqual(wrapper.streamMarkers[0].videos[0].markers[0].createdAt, ISO8601DateFormatter().date(from: "2018-08-20T20:10:03Z"))
        XCTAssertEqual(wrapper.streamMarkers[0].videos[0].markers[0].description, "hello, this is a marker!")
        XCTAssertEqual(wrapper.streamMarkers[0].videos[0].markers[0].positionSeconds, 244)
        XCTAssertEqual(wrapper.streamMarkers[0].videos[0].markers[0].url.absoluteString, expectedURL: "https://twitch.tv/videos/456?t=0h4m06s")
    }
}
