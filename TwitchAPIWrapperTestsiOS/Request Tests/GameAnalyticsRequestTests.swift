//
//  GameAnalyticsRequestTests.swift
//  TwitchAPIWrapperTestsiOS
//
//  Created by Eric Vennaro on 4/4/18.
//

import XCTest

@testable import TwitchAPIWrapper

class GameAnalyticsRequestTests: XCTestCase {
    func testBuildGameAnalyticsRequest_withGameId() {
        let request = GameAnalyticsRequest(gameId: "123")
        XCTAssertEqual(request.url?.absoluteString, "https://api.twitch.tv/helix/analytics/games?game_id=123")
        XCTAssertEqual(request.method, "GET")
        XCTAssertEqual(request.data, Data())
        XCTAssertEqual(request.headers, [:])
    }
    
    func testBuildGameAnalyticsRequest_withoutGameId() {
        let request = GameAnalyticsRequest()
        XCTAssertEqual(request.url?.absoluteString, "https://api.twitch.tv/helix/analytics/games?")
        XCTAssertEqual(request.method, "GET")
        XCTAssertEqual(request.data, Data())
        XCTAssertEqual(request.headers, [:])
    }
}
