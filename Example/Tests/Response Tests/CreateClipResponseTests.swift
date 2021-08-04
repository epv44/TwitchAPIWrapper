//
//  CreateClipResponseTests.swift
//  TwitchAPIWrapper_Tests
//
//  Created by Eric Vennaro on 8/2/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import TwitchAPIWrapper

class CreateClipResponseTests: XCTestCase {

    func testBuildModel_shouldSucceed() throws {
        let decoder = JSONDecoder.twitchAPIStandard()
        
        let wrapper = try decoder.decode(CreateClipResponse.self, from: Fixtures.dataFromFixtureFile("CreateClipResponse"))
        XCTAssertEqual(wrapper.clips[0].id, "FiveWordsForClipSlug")
        XCTAssertEqual(wrapper.clips[0].editUrl, URL(string: "http://clips.twitch.tv/FiveWordsForClipSlug/edit"))
    }
}
