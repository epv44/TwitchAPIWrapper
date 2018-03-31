//
//  UserFollowModelTests.swift
//  TwitchAPIWrapperTestsiOS
//
//  Created by Eric Vennaro on 3/30/18.
//

import XCTest

@testable import TwitchAPIWrapper

class UserFollowModelTests: XCTestCase {
    func testBuildUserFollowModelFromJSON() {
        let decoder = JSONDecoder.twitchAPIStandard()
        do {
            let wrapper = try decoder.decode(UserFollow.self, from: Fixtures.dataFromFixtureFile("UserFollow"))
            let follow1 = wrapper.follows[0]
            let follow2 = wrapper.follows[1]
            XCTAssertEqual(wrapper.total, 12345)
            XCTAssertEqual(wrapper.pagination.cursor, "eyJiIjpudWxsLCJhIjoiMTUwMzQ0MTc3NjQyNDQyMjAwMCJ9")
            
            XCTAssertEqual(follow1.followedAt, Date.twitchStandardDateFormatter.date(from: "2017-08-22T22:55:24Z"))
            XCTAssertEqual(follow1.fromId, "171003792")
            XCTAssertEqual(follow1.toId, "23161357")
            
            XCTAssertEqual(follow2.followedAt, Date.twitchStandardDateFormatter.date(from: "2017-08-22T22:55:04Z"))
            XCTAssertEqual(follow2.fromId, "113627897")
            XCTAssertEqual(follow2.toId, "23161357")
        } catch {
            print(error)
        }
    }
}
