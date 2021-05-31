//
//  GetVideoResponseTests.swift
//  TwitchAPIWrapper_Tests
//
//  Created by Eric Vennaro on 5/25/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import TwitchAPIWrapper

class GetVideoResponseTests: XCTestCase {
    
    func testBuildModel_shouldSucceed() throws {
        let decoder = JSONDecoder.twitchAPIStandard()
        
        let wrapper = try decoder.decode(VideoResponse.self, from: Fixtures.dataFromFixtureFile("Video"))
        let video = wrapper.videos[0]
        XCTAssertEqual(video.createdAt, ISO8601DateFormatter().date(from: "2018-11-14T21:30:18Z"))
        XCTAssertEqual(video.description, "Welcome to Twitch development! Here is a quick overview of our products and information to help you get started.")
        XCTAssertEqual(video.duration, "3m21s")
        XCTAssertEqual(video.id, "335921245")
        XCTAssertEqual(video.language, "en")
        XCTAssertEqual(video.publishedAt, ISO8601DateFormatter().date(from: "2018-11-14T22:04:30Z"))
        XCTAssertEqual(video.thumbnailUrl, "https://static-cdn.jtvnw.net/cf_vods/d2nvs31859zcd8/twitchdev/335921245/ce0f3a7f-57a3-4152-bc06-0c6610189fb3/thumb/index-0000000000-%{width}x%{height}.jpg")
        XCTAssertEqual(video.title, "Twitch Developers 101")
        XCTAssertEqual(video.type, VideoType.upload)
        XCTAssertEqual(video.url.absoluteString, URL(string: "https://www.twitch.tv/videos/335921245")?.absoluteString)
        XCTAssertEqual(video.userId, "141981764")
        XCTAssertEqual(video.viewable, Viewable.public)
        XCTAssertEqual(video.viewCount, 1863062)
        XCTAssertNil(video.streamId)
        XCTAssertEqual(video.userName, "TwitchDev")
        XCTAssertEqual(video.userLogin, "twitchdev")
        XCTAssertEqual(video.mutedSegments![0].duration, 30)
        XCTAssertEqual(video.mutedSegments![0].offset, 120)
    }
}
