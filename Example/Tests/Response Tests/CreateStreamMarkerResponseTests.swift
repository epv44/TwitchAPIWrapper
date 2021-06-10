//
//  CreateStreamMarkerResponseTests.swift
//  TwitchAPIWrapper_Tests
//
//  Created by Eric Vennaro on 6/9/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import TwitchAPIWrapper

class CreateStreamMarkerResponseTests: XCTestCase {

    func testBuildModel_shouldSucceed() throws {
        let decoder = JSONDecoder.twitchAPIStandard()
        
        let wrapper = try decoder.decode(CreateStreamMarkerResponse.self, from: Fixtures.dataFromFixtureFile("CreateStreamMarker"))
        XCTAssertEqual(wrapper.data[0].id, 123)
        XCTAssertEqual(wrapper.data[0].createdAt, ISO8601DateFormatter().date(from: "2018-08-20T20:10:03Z"))
        XCTAssertEqual(wrapper.data[0].description, "hello, this is a marker!")
        XCTAssertEqual(wrapper.data[0].positionSeconds, 244)
    }
}
