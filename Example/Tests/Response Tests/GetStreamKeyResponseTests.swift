//
//  GetStreamKeyResponseTests.swift
//  TwitchAPIWrapper_Tests
//
//  Created by Eric Vennaro on 6/14/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import TwitchAPIWrapper

class GetStreamKeyResponseTests: XCTestCase {

    func testBuildModel_shouldSucceed() throws {
        let decoder = JSONDecoder.twitchAPIStandard()
        
        let wrapper = try decoder.decode(StreamKeyResponse.self, from: Fixtures.dataFromFixtureFile("StreamKey"))
        XCTAssertEqual(wrapper.keys[0].streamKey, "live_44322889_a34ub37c8ajv98a0")
    }
}
