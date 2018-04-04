//
//  ClipRequestTests.swift
//  TwitchAPIWrapperTestsiOS
//
//  Created by Eric Vennaro on 4/3/18.
//

import XCTest

@testable import TwitchAPIWrapper

class ClipRequestTests: XCTestCase {
    override func setUp() {
        TwitchAuthorizationManager.sharedInstance.clientID = "1"
    }
    
    func testBuildClipRequest() {
        let request = ClipRequest()
        XCTAssertEqual(request.url?.absoluteString, "https://api.twitch.tv/helix/clips")
        XCTAssertEqual(request.method, "GET")
        XCTAssertEqual(request.data, Data())
        XCTAssertEqual(request.headers, ["Client-ID": "1"])
    }
    
    func testBuildClipRequest_withId() {
        let request = ClipRequest(id: "100")
        XCTAssertEqual(request.url?.absoluteString, "https://api.twitch.tv/helix/clips?id=100")
        XCTAssertEqual(request.method, "GET")
        XCTAssertEqual(request.data, Data())
        XCTAssertEqual(request.headers, ["Client-ID": "1"])
    }
}
