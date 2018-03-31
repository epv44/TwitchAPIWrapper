//
//  VideoModelTests.swift
//  TwitchAPIWrapperTestsiOS
//
//  Created by Eric Vennaro on 3/30/18.
//

import Foundation

import XCTest

@testable import TwitchAPIWrapper

class VideoModelTests: XCTestCase {
    func testBuildVideoModelFromJSON() {
        let decoder = JSONDecoder.twitchAPIStandard()
        do {
            let wrapper = try decoder.decode(VideoWrapper.self, from: Fixtures.dataFromFixtureFile("Video"))
            let video = wrapper.videos[0]
            let date = Date.twitchStandardDateFormatter.date(from: "2018-03-02T20:53:41Z")
            XCTAssertEqual(video.createdAt, date)
            XCTAssertEqual(video.description, "")
            XCTAssertEqual(video.duration, "3h8m33s")
            XCTAssertEqual(video.id, "234482848")
            XCTAssertEqual(video.language, "en")
            XCTAssertEqual(video.publishedAt, date)
            XCTAssertEqual(video.thumbnailURL, URL(string: "https://static-cdn.jtvnw.net/s3_vods/bebc8cba2926d1967418_chewiemelodies_27786761696_805342775/thumb/thumb0-%{width}x%{height}.jpg"))
            XCTAssertEqual(video.title, "-")
            XCTAssertEqual(video.type, VideoType.archive)
            XCTAssertEqual(video.url, URL(string: "https://www.twitch.tv/videos/234482848"))
            XCTAssertEqual(video.userId, "67955580")
            XCTAssertEqual(video.viewable, Viewable.public)
            XCTAssertEqual(video.viewCount, 142)
        } catch {
            print(error)
        }
    }
}
