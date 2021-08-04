//
//  UpdateEventSubscriptionRequestTests.swift
//  TwitchAPIWrapper_Tests
//
//  Created by Eric Vennaro on 8/3/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import TwitchAPIWrapper

class UpdateEventSubscriptionRequestTests: XCTestCase {
    
    override func setUpWithError() throws {
        TwitchAuthorizationManager.sharedInstance.clientID = "1"
        TwitchAuthorizationManager.sharedInstance.credentials = Credentials(accessToken: "XXX", scopes: ["user", "read"])
        super.setUp()
    }

    func testExample() throws {
        let request = try UpdateEventSubscriptionRequest(type: "1", version: "2", condition: ["type":"webhook"], transport: ["callback": "https://google.com"])
        
        XCTAssertEqual(
            request.url!.absoluteString,
            expectedURL: "https://api.twitch.tv/helix/eventsub/subscriptions")
        let d = try JSONSerialization.jsonObject(with: request.data, options: .allowFragments) as! [String:Any]
        XCTAssertEqual(d["type"] as? String, "1")
        XCTAssertEqual(d["version"] as? String, "2")
        XCTAssertEqual(d["condition"] as? [String:String], ["type": "webhook"])
        XCTAssertEqual(d["transport"] as? [String:String], ["callback": "https://google.com"])
        XCTAssertEqual(request.headers, ["Client-Id": "1", "Authorization": "Bearer XXX"])
    }
}
