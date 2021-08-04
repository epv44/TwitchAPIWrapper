//
//  AutoModStatusResponseTests.swift
//  TwitchAPIWrapper_Tests
//
//  Created by Eric Vennaro on 8/3/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import TwitchAPIWrapper

class AutoModStatusResponseTests: XCTestCase {

    func testBuildModel_shouldSucceed() throws {
        let decoder = JSONDecoder.twitchAPIStandard()
        
        let wrapper = try decoder.decode(
            CheckAutoModStatusResponse.self, from: Fixtures.dataFromFixtureFile("AutoModStatus"))
        XCTAssertEqual(wrapper.data[0].msgId, "123")
        XCTAssertEqual(wrapper.data[0].isPermitted, true)
    }
}
