//
//  GetGamesResponseTests.swift
//  TwitchAPIWrapper_Tests
//
//  Created by Eric Vennaro on 6/14/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import TwitchAPIWrapper

class GetGamesResponseTests: XCTestCase {

    func testBuildModel_shouldSucceed() throws {
        let decoder = JSONDecoder.twitchAPIStandard()
        
        let wrapper = try decoder.decode(GameResponse.self, from: Fixtures.dataFromFixtureFile("SearchCategories"))
        XCTAssertEqual(wrapper.pagination?.cursor, "eyJiIjpudWxsLCJhIjp7IkN")
        XCTAssertEqual(wrapper.games[0].id, "33214")
        XCTAssertEqual(wrapper.games[0].name, "Fortnite")
        XCTAssertEqual(wrapper.games[0].boxArtUrl, "https://static-cdn.jtvnw.net/ttv-boxart/Fortnite-{width}x{height}.jpg")
    }
}
