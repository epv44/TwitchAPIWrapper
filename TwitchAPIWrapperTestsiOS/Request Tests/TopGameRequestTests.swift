//
//  TopGameRequestTests.swift
//  TwitchAPIWrapperTestsiOS
//
//  Created by Eric Vennaro on 4/4/18.
//

import XCTest

@testable import TwitchAPIWrapper

class TopGameRequestTests: XCTestCase {
    override func setUp() {
        TwitchAuthorizationManager.sharedInstance.clientID = "1"
    }
    
    func testBuildGameRequest() {
        let request = TopGameRequest()
        XCTAssertEqual(request.url?.absoluteString, "https://api.twitch.tv/helix/games/top?")
        XCTAssertEqual(request.method, "GET")
        XCTAssertEqual(request.data, Data())
        XCTAssertEqual(request.headers, ["Client-ID":"1"])
    }
    
    func testBuildGameRequest_withEverything() {
        let request = TopGameRequest(after: "10", before: "30", first: "20")
        XCTAssertEqual(request.url?.absoluteString, "https://api.twitch.tv/helix/games/top?after=10&before=30&first=20")
        XCTAssertEqual(request.method, "GET")
        XCTAssertEqual(request.data, Data())
        XCTAssertEqual(request.headers, ["Client-ID":"1"])
    }
}

