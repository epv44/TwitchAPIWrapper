//
//  FollowedStreamsResponseTests.swift
//  TwitchAPIWrapper_Tests
//
//  Created by Eric Vennaro on 6/9/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import TwitchAPIWrapper

class FollowedStreamsResponseTests: XCTestCase {

    func testBuildModel_shouldSucceed() throws {
        let decoder = JSONDecoder.twitchAPIStandard()
        
        let wrapper = try decoder.decode(StreamResponse.self, from: Fixtures.dataFromFixtureFile("DeleteVideo"))
        XCTAssertEqual(wrapper.data, ["1234", "9876"])
    }
}
