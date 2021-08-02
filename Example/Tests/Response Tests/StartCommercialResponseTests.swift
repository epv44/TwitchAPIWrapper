//
//  StreamsResponseTests.swift
//  TwitchAPIWrapper_Tests
//
//  Created by Eric Vennaro on 6/9/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import TwitchAPIWrapper

class StartCommercialResponseTests: XCTestCase {

    func testBuildModel_shouldSucceed() throws {
        let decoder = JSONDecoder.twitchAPIStandard()
        
        let wrapper = try decoder.decode(CommercialResponse.self, from: Fixtures.dataFromFixtureFile("Commercial"))
        XCTAssertEqual(wrapper.commercials[0].length, 60)
        XCTAssertEqual(wrapper.commercials[0].message, "")
        XCTAssertEqual(wrapper.commercials[0].retryAfter, 480)
    }
}
