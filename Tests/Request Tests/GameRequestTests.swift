//
//  GameRequestTests.swift
//  TwitchAPIWrapperTestsiOS
//
//  Created by Eric Vennaro on 4/4/18.
//

import XCTest

@testable import TwitchAPIWrapper

class GameRequestTests: XCTestCase {
    func testBuildGameRequest_withName() {
        TwitchAuthorizationManager.sharedInstance.clientID = "1"
        let request = GameRequest(id: ["a"], name: [])
        XCTAssertEqual(request.url?.absoluteString, "https://api.twitch.tv/helix/games?id=a")
        XCTAssertEqual(request.method, .get)
        XCTAssertEqual(request.data, Data())
        XCTAssertEqual(request.headers, ["Client-ID": "1"])
    }
    
    func testBuildgameRequest_withId() {
        TwitchAuthorizationManager.sharedInstance.clientID = "1"
        let request = GameRequest(id: [], name: ["marshal"])
        XCTAssertEqual(request.url?.absoluteString, "https://api.twitch.tv/helix/games?name=marshal")
        XCTAssertEqual(request.method, .get)
        XCTAssertEqual(request.data, Data())
        XCTAssertEqual(request.headers, ["Client-ID": "1"])
    }
    
    func testBuildGameRequest_withMultipleNames() {
        TwitchAuthorizationManager.sharedInstance.clientID = "1"
        let request = GameRequest(id: ["a", "b"], name: [])
        XCTAssertEqual(request.url?.absoluteString, "https://api.twitch.tv/helix/games?id=a&id=b")
        XCTAssertEqual(request.method, .get)
        XCTAssertEqual(request.data, Data())
        XCTAssertEqual(request.headers, ["Client-ID": "1"])
    }
    
    func testBuildgameRequest_withMultipleIds() {
        TwitchAuthorizationManager.sharedInstance.clientID = "1"
        let request = GameRequest(id: [], name: ["marshal", "mathers"])
        XCTAssertEqual(request.url?.absoluteString, "https://api.twitch.tv/helix/games?name=marshal&name=mathers")
        XCTAssertEqual(request.method, .get)
        XCTAssertEqual(request.data, Data())
        XCTAssertEqual(request.headers, ["Client-ID": "1"])
    }
    
    func testBuildgameRequest_withMultipleIdsAndNames() {
        TwitchAuthorizationManager.sharedInstance.clientID = "1"
        let request = GameRequest(id: ["a", "b"], name: ["marshal", "mathers"])
        XCTAssertEqual(request.url?.absoluteString, "https://api.twitch.tv/helix/games?id=a&id=b&name=marshal&name=mathers")
        XCTAssertEqual(request.method, .get)
        XCTAssertEqual(request.data, Data())
        XCTAssertEqual(request.headers, ["Client-ID": "1"])
    }
    
    func testBuildGameRequest_withoutClientId() {
        TwitchAuthorizationManager.sharedInstance.clientID = nil
        let request = GameRequest(id: ["a", "b"], name: ["marshal", "mathers"])
        XCTAssertEqual(request.url?.absoluteString, "https://api.twitch.tv/helix/games?id=a&id=b&name=marshal&name=mathers")
        XCTAssertEqual(request.method, .get)
        XCTAssertEqual(request.data, Data())
        XCTAssertEqual(request.headers, [:])
    }
}

