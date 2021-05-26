//
//  StreamMetadataRequestTest.swift
//  TwitchAPIWrapperTestsiOS
//
//  Created by Eric Vennaro on 4/4/18.
//

import XCTest

@testable import TwitchAPIWrapper

class StreamMetadataRequestTests: XCTestCase {
    func testBuildStreamMetadataRequest() {
        TwitchAuthorizationManager.sharedInstance.clientID = "1"
        let request = StreamMetadataRequest()
        XCTAssertEqual(request.url?.absoluteString, "https://api.twitch.tv/helix/streams/metadata?type=all")
        XCTAssertEqual(request.method, .get)
        XCTAssertEqual(request.data, Data())
        XCTAssertEqual(request.headers, ["Client-ID":"1"])
    }
    
    func testBuildStreamMetadataRequest_withEverything() {
        TwitchAuthorizationManager.sharedInstance.clientID = "1"
        let request = StreamMetadataRequest(after: "abc", before: "dfg", communityId: ["2", "3"], first: "100", gameId: ["1","2"], language: ["en"], type:.all, userId: ["abcd"], userLogin: ["marshal mathers"])
        XCTAssertEqual(request.url?.absoluteString, "https://api.twitch.tv/helix/streams/metadata?user_login=marshal%20mathers&after=abc&game_id=1&game_id=2&language=en&user_id=abcd&type=all&before=dfg&first=100&community_id=2&community_id=3")
        XCTAssertEqual(request.method, .get)
        XCTAssertEqual(request.data, Data())
        XCTAssertEqual(request.headers, ["Client-ID":"1"])
    }
    
    func testBuildStreamMetadataRequest_withoutClientId() {
        TwitchAuthorizationManager.sharedInstance.clientID = nil
        let request = StreamMetadataRequest()
        XCTAssertEqual(request.url?.absoluteString, "https://api.twitch.tv/helix/streams/metadata?type=all")
        XCTAssertEqual(request.method, .get)
        XCTAssertEqual(request.data, Data())
        XCTAssertEqual(request.headers, [:])
    }
}
