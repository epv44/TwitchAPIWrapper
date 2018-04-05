//
//  StreamRequestTests.swift
//  TwitchAPIWrapperTestsiOS
//
//  Created by Eric Vennaro on 4/4/18.
//

import XCTest

@testable import TwitchAPIWrapper

class StreamRequestTests: XCTestCase {
    override func setUp() {
        TwitchAuthorizationManager.sharedInstance.clientID = "1"
    }
    
    func testBuildStreamRequest() {
        let request = StreamRequest()
        XCTAssertEqual(request.url?.absoluteString, "https://api.twitch.tv/helix/streams?")
        XCTAssertEqual(request.method, "GET")
        XCTAssertEqual(request.data, Data())
        XCTAssertEqual(request.headers, ["Client-ID":"1"])
    }
    
    func testBuildStreamRequest_withEverything() {
        let request = StreamRequest(after: "abc", before: "dfg", communityId: ["2", "3"], first: "100", gameId: ["1","2"], language: ["en"], userId: ["abcd"], userLogin: ["marshal mathers"])
        XCTAssertEqual(request.url?.absoluteString, "https://api.twitch.tv/helix/streams?user_login=marshal%20mathers&after=abc&game_id=1&game_id=2&language=en&user_id=abcd&before=dfg&first=100&community_id=2&community_id=3")
        XCTAssertEqual(request.method, "GET")
        XCTAssertEqual(request.data, Data())
        XCTAssertEqual(request.headers, ["Client-ID":"1"])
    }
}
