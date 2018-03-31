//
//  ClipModelTests.swift
//  TwitchAPIWrapperTestsiOS
//
//  Created by Eric Vennaro on 3/30/18.
//

import XCTest

@testable import TwitchAPIWrapper

class ClipModelTests: XCTestCase {
    func testBuildClipModelFromJSON() {
        let decoder = JSONDecoder.twitchAPIStandard()
        do {
            let clipWrapper = try decoder.decode(ClipWrapper.self, from: Fixtures.dataFromFixtureFile("Clip"))
            let clip = clipWrapper.clips[0]
            let date = Date.twitchStandardDateFormatter.date(from: "2017-11-30T22:34:18Z")
            XCTAssertEqual(clip.id, "AwkwardHelplessSalamanderSwiftRage")
            XCTAssertEqual(clip.url, URL(string: "https://clips.twitch.tv/AwkwardHelplessSalamanderSwiftRage"))
            XCTAssertEqual(clip.embedURL, URL(string: "https://clips.twitch.tv/embed?clip=AwkwardHelplessSalamanderSwiftRage"))
            XCTAssertEqual(clip.broadcasterId, "67955580")
            XCTAssertEqual(clip.creatorId, "53834192")
            XCTAssertEqual(clip.videoId, "205586603")
            XCTAssertEqual(clip.gameId, "488191")
            XCTAssertEqual(clip.language, "en")
            XCTAssertEqual(clip.title, "babymetal")
            XCTAssertEqual(clip.viewCount, 10)
            XCTAssertEqual(clip.createdAt, date)
        } catch {
            print(error)
        }
    }
}


