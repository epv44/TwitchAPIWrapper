//
//  ChannelInfoResponseTests.swift
//  TwitchAPIWrapper_Tests
//
//  Created by Eric Vennaro on 8/1/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import TwitchAPIWrapper

class ChannelInfoResponseTests: XCTestCase {

    func testBuildModel_shouldSucceed() throws {
        let decoder = JSONDecoder.twitchAPIStandard()
        
        let wrapper = try decoder.decode(ChannelInformationResponse.self, from: Fixtures.dataFromFixtureFile("ChannelInfo"))
        XCTAssertEqual(wrapper.channels[0].broadcasterId, "141981764")
        XCTAssertEqual(wrapper.channels[0].broadcasterLogin, "twitchdev")
        XCTAssertEqual(wrapper.channels[0].broadcasterName, "TwitchDev")
        XCTAssertEqual(wrapper.channels[0].broadcasterLanguage, "en")
        XCTAssertEqual(wrapper.channels[0].gameId, "509670")
        XCTAssertEqual(wrapper.channels[0].gameName, "Science & Technology")
        XCTAssertEqual(wrapper.channels[0].title, "TwitchDev Monthly Update // May 6, 2021")
        XCTAssertEqual(wrapper.channels[0].delay, 0)
    }
}
