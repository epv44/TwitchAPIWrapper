//
//  SearchChannelResponseTests.swift
//  TwitchAPIWrapper_Tests
//
//  Created by Eric Vennaro on 6/14/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import TwitchAPIWrapper

class SearchChannelResponseTests: XCTestCase {

    func testBuildModel_shouldSucceed() throws {
        let decoder = JSONDecoder.twitchAPIStandard()
        
        let wrapper = try decoder.decode(SearchChannelResponse.self, from: Fixtures.dataFromFixtureFile("SearchChannel"))
        XCTAssertEqual(wrapper.pagination?.cursor, "Mg==")
        XCTAssertEqual(wrapper.searchChannels[0].broadcasterLanguage, "en")
        XCTAssertEqual(wrapper.searchChannels[0].broadcasterLogin, "loserfruit")
        XCTAssertEqual(wrapper.searchChannels[0].displayName, "Loserfruit")
        XCTAssertEqual(wrapper.searchChannels[0].gameId, "498000")
        XCTAssertEqual(wrapper.searchChannels[0].gameName, "House Flipper")
        XCTAssertEqual(wrapper.searchChannels[0].id, "41245072")
        XCTAssertFalse(wrapper.searchChannels[0].isLive)
        XCTAssertEqual(wrapper.searchChannels[0].tagIds, [])
        XCTAssertEqual(wrapper.searchChannels[0].thumbnailUrl, URL(string: "https://static-cdn.jtvnw.net/jtv_user_pictures/fd17325a-7dc2-46c6-8617-e90ec259501c-profile_image-300x300.png"))
        XCTAssertEqual(wrapper.searchChannels[0].title, "loserfruit")
        XCTAssertEqual(wrapper.searchChannels[0].startedAt, ISO8601DateFormatter().date(from: "2020-03-18T17:56:00Z"))
    }
}
