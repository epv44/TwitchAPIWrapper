//
//  LeaderboardRequestTest.swift
//  TwitchAPIWrapperTestsiOS
//
//  Created by Eric Vennaro on 4/4/18.
//

import XCTest

@testable import TwitchAPIWrapper

class LeaderboardRequestTests: XCTestCase {
    func testBuildLeaderboardRequest() {
        TwitchAuthorizationManager.sharedInstance.clientID = "1"
        let request = LeaderboardRequest()
        XCTAssertEqual(request.url?.absoluteString, "https://api.twitch.tv/helix/bits/leaderboard?")
        XCTAssertEqual(request.method, .get)
        XCTAssertEqual(request.data, Data())
        XCTAssertEqual(request.headers, ["Client-ID":"1"])
    }
    
    func testBuildLeaderboardRequest_withEverything() {
        TwitchAuthorizationManager.sharedInstance.clientID = "1"
        let request = LeaderboardRequest(count: "10", period: "10", startedAt: "12")
        XCTAssertEqual(request.url?.absoluteString, "https://api.twitch.tv/helix/bits/leaderboard?period=10&started_at=12&count=10")
        XCTAssertEqual(request.method, .get)
        XCTAssertEqual(request.data, Data())
        XCTAssertEqual(request.headers, ["Client-ID":"1"])
    }
    
    func testBuildLeaderboardRequest_withoutClientId() {
        TwitchAuthorizationManager.sharedInstance.clientID = nil
        let request = LeaderboardRequest(count: "10", period: "10", startedAt: "12")
        XCTAssertEqual(request.url?.absoluteString, "https://api.twitch.tv/helix/bits/leaderboard?period=10&started_at=12&count=10")
        XCTAssertEqual(request.method, .get)
        XCTAssertEqual(request.data, Data())
        XCTAssertEqual(request.headers, [:])
    }
}
