//
//  ChannelEditorsResponseTests.swift
//  TwitchAPIWrapper_Tests
//
//  Created by Eric Vennaro on 8/1/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import TwitchAPIWrapper

class ChannelEditorsResponseTests: XCTestCase {

    func testBuildModel_shouldSucceed() throws {
        let decoder = JSONDecoder.twitchAPIStandard()
        
        let wrapper = try decoder.decode(ChannelEditorResponse.self, from: Fixtures.dataFromFixtureFile("ChannelEditors"))
        XCTAssertEqual(wrapper.channelsEditors[0].userId, "182891647")
        XCTAssertEqual(wrapper.channelsEditors[0].userName, "mauerbac")
        XCTAssertEqual(
            wrapper.channelsEditors[0].createdAt, ISO8601DateFormatter().date(from: "2018-08-07T02:07:55Z"))
    }
}
