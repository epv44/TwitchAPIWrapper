//
//  GameRequestTests.swift
//  TwitchAPIWrapperTestsiOS
//
//  Created by Eric Vennaro on 4/4/18.
//

import XCTest

@testable import TwitchAPIWrapper

class GameRequestTests: XCTestCase {
    override func setUp() {
        TwitchAuthorizationManager.sharedInstance.clientID = "1"
    }
    
    func testBuildGameRequest_withName() {
        let request = GameRequest(id: ["a"], name: [])
        XCTAssertEqual(request.url?.absoluteString, "https://api.twitch.tv/helix/games?id=a")
        XCTAssertEqual(request.method, "GET")
        XCTAssertEqual(request.data, Data())
        XCTAssertEqual(request.headers, ["Client-ID": "1"])
    }
    
    func testBuildgameRequest_withId() {
        let request = GameRequest(id: [], name: ["marshal"])
        XCTAssertEqual(request.url?.absoluteString, "https://api.twitch.tv/helix/games?name=marshal")
        XCTAssertEqual(request.method, "GET")
        XCTAssertEqual(request.data, Data())
        XCTAssertEqual(request.headers, ["Client-ID": "1"])
    }
    
    func testBuildGameRequest_withMultipleNames() {
        let request = GameRequest(id: ["a", "b"], name: [])
        XCTAssertEqual(request.url?.absoluteString, "https://api.twitch.tv/helix/games?id=a&id=b")
        XCTAssertEqual(request.method, "GET")
        XCTAssertEqual(request.data, Data())
        XCTAssertEqual(request.headers, ["Client-ID": "1"])
    }
    
    func testBuildgameRequest_withMultipleIds() {
        let request = GameRequest(id: [], name: ["marshal", "mathers"])
        XCTAssertEqual(request.url?.absoluteString, "https://api.twitch.tv/helix/games?name=marshal&name=mathers")
        XCTAssertEqual(request.method, "GET")
        XCTAssertEqual(request.data, Data())
        XCTAssertEqual(request.headers, ["Client-ID": "1"])
    }
    
    func testBuildgameRequest_withMultipleIdsAndNames() {
        let request = GameRequest(id: ["a", "b"], name: ["marshal", "mathers"])
        XCTAssertEqual(request.url?.absoluteString, "https://api.twitch.tv/helix/games?id=a&id=b&name=marshal&name=mathers")
        XCTAssertEqual(request.method, "GET")
        XCTAssertEqual(request.data, Data())
        XCTAssertEqual(request.headers, ["Client-ID": "1"])
    }
}

