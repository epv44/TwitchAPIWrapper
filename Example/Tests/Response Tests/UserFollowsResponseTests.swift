//
//  UserFollowsResponseTests.swift
//  TwitchAPIWrapper_Tests
//
//  Created by Eric Vennaro on 6/9/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import TwitchAPIWrapper

class UserFollowsResponseTests: XCTestCase {
    
    func testBuildModel_shouldSucceed() throws {
        let decoder = JSONDecoder.twitchAPIStandard()
        
        let wrapper = try! decoder.decode(UserFollowResponse.self, from: Fixtures.dataFromFixtureFile("UserFollows"))
        XCTAssertEqual(wrapper.total, 12345)
        XCTAssertEqual(wrapper.follows[0].fromId, "171003792")
        XCTAssertEqual(wrapper.follows[0].fromLogin, "iiisutha067iii")
        XCTAssertEqual(wrapper.follows[0].fromName, "IIIsutha067III")
        XCTAssertEqual(wrapper.follows[0].toId, "23161357")
        XCTAssertEqual(wrapper.follows[0].toName, "LIRIK")
        XCTAssertEqual(wrapper.follows[0].followedAt, ISO8601DateFormatter().date(from: "2017-08-22T22:55:24Z"))
        XCTAssertEqual(wrapper.pagination.cursor, "eyJiIjpudWxsLCJhIjoiMTUwMzQ0MTc3NjQyNDQyMjAwMCJ9")
        
        XCTAssertEqual(wrapper.follows[1].fromId, "113627897")
        XCTAssertEqual(wrapper.follows[1].fromLogin, "birdman616")
        XCTAssertEqual(wrapper.follows[1].fromName, "Birdman616")
        XCTAssertEqual(wrapper.follows[1].toId, "23161357")
        XCTAssertEqual(wrapper.follows[1].toName, "LIRIK")
        XCTAssertEqual(wrapper.follows[1].followedAt, ISO8601DateFormatter().date(from: "2017-08-22T22:55:04Z"))
    }
}
