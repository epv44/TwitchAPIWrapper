//
//  VideoRequestTest.swift
//  TwitchAPIWrapperTestsiOS
//
//  Created by Eric Vennaro on 4/4/18.
//

import XCTest

@testable import TwitchAPIWrapper

class VideoRequestTests: XCTestCase {
    func testBuildVideoRequest_withRequiredParams() {
        let request = VideoRequest(id: ["1"], userId: "abc123", gameId: "tfm")
        XCTAssertEqual(request.url?.absoluteString, "https://api.twitch.tv/helix/videos?id=1&game_id=tfm&user_id=abc123")
        XCTAssertEqual(request.method, "GET")
        XCTAssertEqual(request.data, Data())
        XCTAssertEqual(request.headers, [:])
    }
    
    func testBuildVideoRequest_withEverything() {
        let request = VideoRequest(id: ["1"], userId: "abc123", gameId: "tfm", after: "10-23-92", before: "march", first: "7", language: ["en"], period: "april", sort: "no", type: "all")
        XCTAssertEqual(request.url?.absoluteString, "https://api.twitch.tv/helix/videos?id=1&game_id=tfm&after=10-23-92&sort=no&language=en&user_id=abc123&period=april&before=march&first=7&type=all")
        XCTAssertEqual(request.method, "GET")
        XCTAssertEqual(request.data, Data())
        XCTAssertEqual(request.headers, [:])
    }
}


